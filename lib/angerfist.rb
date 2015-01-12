class AngerFist
  include Rack::Utils

  def initialize(app, tracker_id, domain)
    @app = app
    @gabba = Gabba::Gabba.new(tracker_id, domain)
  end

  def call(env)
    @env = env
    status, headers, response = @app.call(@env)

    @headers = HeaderHash.new(headers)

    if content_type_matches? || path_matches?
      @gabba.page_view(env['PATH_INFO'], env['PATH_INFO'])
    end

    [status, headers, response]
  end

  def content_type_matches?
    @headers.key?('Content-Type') && @headers['Content-Type'].include?('application/json')
  end

  def path_matches?
    @env['PATH_INFO'] == '/torrent'
  end

end
