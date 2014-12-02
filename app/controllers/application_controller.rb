class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # before_action :current_page_user
  helper_method :current_user_access?

  private
    def current_page_user
      @current_page_user = User.find_by_username(params[:username])
      render_404 unless @current_page_user
    end

    def current_user_access?
      user_signed_in?
      @current_page_user.username == current_user.username if user_signed_in?
    end

    def render_404
      render_optional_error_file(404)
    end

    def render_403
      render_optional_error_file(403)
    end

    def render_optional_error_file(status_code)
      status = status_code.to_s
      fname = %W(404 403 422 500).include?(status) ? status : 'unknown'
      render template: "/errors/#{fname}", format: [:html],
             handler: [:haml], status: status, layout: 'application'
    end
end
