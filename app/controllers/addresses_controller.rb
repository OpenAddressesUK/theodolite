class AddressesController < ApplicationController
  respond_to :json, :html

  before_filter :build_query, only: :index
  before_filter :pagination, only: :index
  before_filter(:only => [:index, :show]) { alternate_formats [:json] }

  def show
    @address = Address.find(params[:id])
    respond_to :json, :html
  end

  def index
    if !@queries.empty?
      @addresses = Address.where(@queries).page(@page).per(@per_page)
      render_paginated_addresses
    else
      render "addresses/index"
    end
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
        @queries[:"#{name}.name"] = params[name].upcase if params[name] && params[name] != ''
      end

      if !params[:postcode].blank?
        postcode = UKPostcode.new(params[:postcode]).normalize
        @queries[:"postcode.name"] = postcode
      end
    end

    def render_paginated_addresses
      if @addresses.count == 1
        redirect_to polymorphic_url(@addresses.first, format: params[:format]), status: 307
      else
        paginate @addresses
        respond_to :json, :html
      end
    end
end
