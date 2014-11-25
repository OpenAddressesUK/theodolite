class AddressesController < ApplicationController
  respond_to :json, :html

  before_filter :build_query, only: :index
  before_filter :pagination, only: :index

  def show
    @address = Address.find(params[:id])
  end

  def index
    if @queries.empty?
      @addresses = Address.all
    else
      @addresses = Address.where(@queries)
    end
    @addresses = @addresses.page(@page).per(@per_page)

    render_paginated_addresses
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
        :street,
        :postcode
      ].each do |name|
        @queries[:"#{name}.name"] = params[name].upcase if params[name] && params[name] != ''
      end
    end

    def pagination
      @page = (params[:page] || 1).to_i
      @per_page = (params[:per_page] || 25).to_i
    end

    def render_paginated_addresses
      if @addresses.count == 1
        redirect_to polymorphic_url(@addresses.first, format: params[:format]), status: 307
      else
        respond_to do |format|
          format.json do
            paginate @addresses
            render "addresses/index"
          end
          format.html do
            paginate @addresses
            render "addresses/index"
          end
        end
      end
    end
end
