class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private

    def pagination
      @page = (params[:page] || 1).to_i
      @per_page = (params[:per_page] || 25).to_i
    end
    
end
