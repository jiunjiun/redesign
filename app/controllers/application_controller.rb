class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user_access?
  helper_method :project_page?

  private
    def current_page_user
      @current_page_user = User.find_by_username(params[:username])
      render_404 unless @current_page_user
    end

    def current_user_access?
      user_signed_in?
      @current_page_user.username == current_user.username if user_signed_in?
    end

    def project_data
      @project            = Project.find_by({user: @current_page_user, name: params[:project_name]})
      @star               = Star.where({user: current_user, project: @project})
      @star_project_count = Star.where({project: @project}).size

      @fork_count         = Project.where({from_project: @project}).size
    end

    def project_page?
      params[:controller] == 'home' && params[:action] == 'project' ||
      params[:controller] == 'projects/editors' ||
      params[:controller] == 'projects/settings'
    end

    def render_404
      render_optional_error_file(404)
    end

    def render_403
      render_optional_error_file(403)
    end

    def render_500
      render_optional_error_file(500)
    end

    def render_optional_error_file(status_code)
      status = status_code.to_s
      @fname = %W(404 403 422 500).include?(status) ? status : 'unknown'
      render template: "/errors/#{@fname}", format: [:html],
             handler: [:haml], status: status, layout: 'errors'
    end

    def after_sign_in_path_for(resource)
      if resource.sign_in_count == 1
        settings_profiles_path
      else
        root_path
      end
    end
end
