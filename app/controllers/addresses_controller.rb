class AddressesController < ApplicationController
  respond_to :json, :html

  before_filter :parse_postcode, only: :query
  before_filter :parse_parts, only: :query

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
    }.select { |k, v| ['', '-'].exclude? v }

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

  private

    def parse_postcode
      postcode = UKPostcode.new(params[:postcode].gsub("-", " "))
      params[:postcode] = postcode.norm.to_url
    end

    def parse_parts
      params.each_pair do |k, v|
        params[k] = v.to_url unless k == :postcode
      end
    end
end
