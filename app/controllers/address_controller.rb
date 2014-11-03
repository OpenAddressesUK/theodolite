class AddressController < ApplicationController
  respond_to :json, :html

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
    ).first

    redirect_to url_for(@address)
  end
end
