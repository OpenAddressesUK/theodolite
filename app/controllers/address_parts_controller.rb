class AddressPartsController < ApplicationController
  before_filter :pagination

  def streets
    if params[:q]
      @streets = Street.any_in(:name => Street.name_prefix_search(params[:q]))
    else
      @streets = []
    end
  end

  def street
    @street = Street.find(params[:id])
    @addresses = get_addresses("street", params[:id])

    render_paginated_addresses
  end

  def localities
    if params[:q]
      @localities = Locality.any_in(:name => Locality.name_prefix_search(params[:q]))
    else
      @localities = []
    end
  end

  def locality
    @locality = Locality.find(params[:id])
    @addresses = get_addresses("locality", params[:id])

    render_paginated_addresses
  end

  def towns
    if params[:q]
      @towns = Town.any_in(:name => Town.name_prefix_search(params[:q]))
    else
      @towns = []
    end
  end

  def town
    @town = Town.find(params[:id])
    @addresses = get_addresses("town", params[:id])

    render_paginated_addresses
  end

  def postcodes
    if params[:q]
      @postcodes = Postcode.any_in(:name => Postcode.name_prefix_search(params[:q]))
    else
      @postcodes = []
    end
  end

  def postcode
    postcode = UKPostcode.new(params[:id].gsub("-", " "))
    if postcode.valid?
      @postcode = Postcode.where(name: postcode.norm).first
      @addresses = get_addresses("postcode", @postcode.token)
    else
      @postcode = Postcode.find(params[:id])
      @addresses = get_addresses("postcode", params[:id])
    end

    render_paginated_addresses
  end

  private

    def render_paginated_addresses
      respond_to do |format|
        format.json do
          paginate @addresses
        end
        format.html do
          paginate @addresses
          render "addresses/index"
        end
      end
    end

    def get_addresses(type, id)
      Address.where("#{type}.token" => id).page(@page).per(@per_page)
    end

end
