class AddressController < ApplicationController
  respond_to :json, :html

  def show

    @address = Address.where(
      :postcode_slug => params[:postcode],
      :town_slug => params[:town],
      :locality_slug => params[:locality],
      :street_slug => params[:street],
      :pao_slug => params[:pao],
      :sao_slug => params[:sao]
    ).first

  end
end
