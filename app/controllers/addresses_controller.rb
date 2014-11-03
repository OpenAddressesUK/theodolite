class AddressesController < ApplicationController
  respond_to :json, :html

  def index
    @page = (params[:page] || 1).to_i
    @per_page = (params[:per_page] || 25).to_i

    @addresses = Address.all.page(@page).per(@per_page)

    respond_to do |format|
      format.json { paginate @addresses }
    end
  end

  def show
    @address = Address.find(params[:id])
  end

  def query
    queries = {
      :postcode_slug => params[:postcode],
      :town_slug => params[:town],
      :locality_slug => params[:locality],
      :street_slug => params[:street],
      :pao_slug => params[:pao],
      :sao_slug => params[:sao]
    }.select { |k, v| v != '-' }

    @addresses = Address.where(queries)

    raise ActionController::RoutingError.new('Not Found') if @addresses.count == 0

    if @addresses.count == 1
      redirect_to polymorphic_url(@addresses.first, format: params[:format]), status: 307
    else
      respond_to do |format|
        format.json { render "addresses/index"}
      end
    end
  end
end