class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def get_torrent
    if params[:file]
      redirect_to "/#{params[:file]}"
    else
      raise ActionController::RoutingError.new('Not Found')
    end
  end

  private

    def pagination
      @page = (params[:page] || 1).to_i
      @per_page = (params[:per_page] || 25).to_i
    end

end
