class AddressPartsController < ApplicationController

  def street
    @street = Street.find(params[:id])
    @addresses = Address.where("street.token" => params[:id])
  end

  def locality
    @locality = Locality.find(params[:id])
    @addresses = Address.where("locality.token" => params[:id])
  end

  def town
    @town = Town.find(params[:id])
    @addresses = Address.where("town.token" => params[:id])
  end

  def postcode
    postcode = UKPostcode.new(params[:id].gsub("-", " "))
    if postcode.valid?
      @postcode = Postcode.where(name: postcode.norm).first
      @addresses = Address.where("postcode.token" => @postcode.token)
    else
      @postcode = Postcode.find(params[:id])
      @addresses = Address.where("postcode.token" => params[:id])
    end
  end

end
