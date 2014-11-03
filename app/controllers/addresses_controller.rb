class AddressesController < ApplicationController
  respond_to :json, :html

  def index
    @page = (params[:page] || 1).to_i
    @per_page = (params[:per_page] || 25).to_i
    @total = Address.count
    @pages = (@total.to_f / @per_page.to_f).ceil

    @addresses = Address.all.page(@page).per(@per_page)
  end

  def show
    @address = Address.find(params[:id])
  end

  def query
    @address = Address.where(
      :postcode_slug => params[:postcode],
      :town_slug => params[:town],
      :locality_slug => params[:locality],
      :street_slug => params[:street],
      :pao_slug => params[:pao],
      :sao_slug => params[:sao]
    ).first or raise ActionController::RoutingError.new('Not Found')

    redirect_to polymorphic_url(@address, format: params[:format])
  end
end
