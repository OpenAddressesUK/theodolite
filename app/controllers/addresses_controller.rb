class AddressesController < ApplicationController
  respond_to :json, :html

  before_filter :build_query, only: :index
  before_filter :pagination, only: :index
  before_filter(:only => [:index, :show]) { alternate_formats [:json] }
  before_filter :build_regex, only: :download

  def show
    @address = Address.find(params[:id])
    respond_to :json, :html
  end

  def index
    if !@queries.empty?
      @addresses = Address.all
      @queries.each_pair do |key, value|
        case value.class.name
        when "String"
          @addresses = @addresses.where(key => value)
        when "Array"
          @addresses = @addresses.any_in(key => value)
        when "DateTime"
          @addresses = @addresses.gt(key => value)
        end
      end
      @addresses = @addresses.page(@page).per(@per_page)
      render_paginated_addresses
    else
      render "addresses/index"
    end
  end

  def download
    directory = FOG_CONNECTION.directories.get(JiffyBag['AWS_BUCKET'])
    files = directory.files.to_a.select { |f| @regex =~ f.key }
    file = files.sort_by { |f| f.last_modified }.last

    torrent = params[:torrent] == "true" ? "?torrent" : ""

    redirect_to "#{file.public_url}#{torrent}"
  end

  private

    def build_query
      @queries = {}
      [
        :pao,
        :sao
      ].each do |name|
        @queries[:"#{name}"] = params[name].upcase if params[name]
      end

      [
        :town,
        :locality,
        :street
      ].each do |name|
        if params[name] && params[name] != ''
          klass = Kernel.const_get(name.to_s.capitalize)
          names = klass.name_prefix_search(params[name])
          @queries[:"#{name}.name"] = names
        end
      end

      if params[:updated_since]
        @queries[:updated_at] = DateTime.parse(params[:updated_since])
      end

      if params[:no_inference]
        @queries[:source.ne] = "inference"
      end

      if !params[:postcode].blank?
        postcode = UKPostcode.new(params[:postcode]).normalize
        @queries[:"postcode.name"] = postcode
      end
    end

    def render_paginated_addresses
      if @addresses.count == 1 && params[:format] != 'json'
        redirect_to polymorphic_url(@addresses.first, format: params[:format]), status: 307
      else
        paginate @addresses
        respond_to :json, :html
      end
    end

    def build_regex
      split = params[:split] == "true" ? "\-split" : ""
      type = params[:provenance] == "true" ? "full" : "addresses\-only"
      @regex = /openaddressesuk\-#{type}#{split}\.#{params[:format]}\.zip$/
    end
end
