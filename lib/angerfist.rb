class AngerFist
  include Rack::Utils

  def initialize(app, config)
    @app = app
    @gabba = Gabba::Gabba.new(config[:tracker_id], config[:domain])
    @paths = config[:paths] || []
    @content_types = config[:content_types] || []
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
    @headers.key?('Content-Type') && @content_types.any? { |c| @headers['Content-Type'].include?(c) }
  end

  def path_matches?
    @paths.any? { |p| @env['PATH_INFO'].include?(p) }
  end

end
