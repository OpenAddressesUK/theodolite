require 'spec_helper'
require 'rack'
require 'gabba'
require 'angerfist'

describe AngerFist do

  before(:each) do
    @config = {
      tracker_id: "UA-xxxxxxx-x",
      domain: "http://test.domain"
    }
  end

  it "tracks a page view for the specified content type" do
    content_type =  "application/json"
    app = proc{[200,{"CONTENT-TYPE" => content_type},['Hello, world.']]}
    @config[:content_types] = [ content_type ]
    middleware = AngerFist.new(app, @config)
    request = Rack::MockRequest.new(middleware)

    expect_any_instance_of(Gabba::Gabba).to receive(:page_view)
    request.get('addresses/address.json', { "CONTENT-TYPE" => content_type })
  end

  it "doesn't track a page view when the content type is not specified" do
    content_type =  "text/html"
    app = proc{[200,{"CONTENT-TYPE" => content_type},['Hello, world.']]}
    @config[:content_types] = [ "application/json" ]
    middleware = AngerFist.new(app, @config)
    request = Rack::MockRequest.new(middleware)

    expect_any_instance_of(Gabba::Gabba).to_not receive(:page_view)
    request.get('addresses/address.json', { "CONTENT-TYPE" => content_type })
  end

  it "tracks a page view for the specified path" do
    app = proc{[200,{},['Hello, world.']]}
    @config[:paths] = ["/torrent"]
    middleware = AngerFist.new(app, @config)
    request = Rack::MockRequest.new(middleware)

    expect_any_instance_of(Gabba::Gabba).to receive(:page_view)
    request.get('/torrent?file=foo.torrent')
  end

end
