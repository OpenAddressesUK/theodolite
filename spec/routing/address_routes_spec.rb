require "rails_helper"

describe "routes" do

  it "should route addresses queries" do
    expect(:get => "/addresses?town=london&locality=372-old-street&postcode=ec1v-9av&street=old-street&pao=372&sao=335-rosden-house").to route_to(
      controller: "addresses",
      action: "index",
      town: "london",
      locality: "372-old-street",
      postcode: "ec1v-9av",
      street: "old-street",
      pao: "372",
      sao: "335-rosden-house"
    )    
  end
  
end

