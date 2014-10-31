class AddressController < ApplicationController
  def show
    Address.where('street.name' => params[:street])
  end
end
