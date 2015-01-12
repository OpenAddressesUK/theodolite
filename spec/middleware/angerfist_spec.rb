require 'spec_helper'
require 'rack'
require 'gabba'
require 'angerfist'

describe AngerFist do

  it "tracks a page view for JSON" do
    content_type =  "application/json"
    app = proc{[200,{"CONTENT-TYPE" => content_type},['Hello, world.']]}
    middleware = AngerFist.new(app, "UA-xxxxxxx-x", "http://test.domain")
    request = Rack::MockRequest.new(middleware)

    expect_any_instance_of(Gabba::Gabba).to receive(:page_view)
    request.get('addresses/address.json', { "CONTENT-TYPE" => content_type })
  end

  it "doesn't track a page view for HTML" do
    content_type =  "text/html"
    app = proc{[200,{"CONTENT-TYPE" => content_type},['Hello, world.']]}
    middleware = AngerFist.new(app, "UA-xxxxxxx-x", "http://test.domain")
    request = Rack::MockRequest.new(middleware)

    expect_any_instance_of(Gabba::Gabba).to_not receive(:page_view)
    request.get('addresses/address.json', { "CONTENT-TYPE" => content_type })
  end

  it "tracks a page view for a torrent download" do
    app = proc{[200,{},['Hello, world.']]}
    middleware = AngerFist.new(app, "UA-xxxxxxx-x", "http://test.domain")
    request = Rack::MockRequest.new(middleware)

    expect_any_instance_of(Gabba::Gabba).to receive(:page_view)
    request.get('/torrent?file=foo.torrent')
  end

end
