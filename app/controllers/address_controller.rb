class AddressController < ApplicationController
  def show
    binding.pry
    Address.where('street.name' => params[:street])
  end
end
