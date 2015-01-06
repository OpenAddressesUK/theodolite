class AngerFist
  include Rack::Utils

  def initialize(app, tracker_id, domain)
    @app = app
    @gabba = Gabba::Gabba.new(tracker_id, domain)
  end

  def call(env)
    status, headers, response = @app.call(env)

    headers = HeaderHash.new(headers)

    if headers.key?('Content-Type') && headers['Content-Type'].include?('application/json')
      @gabba.page_view(env['PATH_INFO'], env['PATH_INFO'])
    end

    [status, headers, response]
  end

end
