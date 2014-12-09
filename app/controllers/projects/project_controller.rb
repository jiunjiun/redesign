class Projects::ProjectController < ApplicationController
  before_action :user_access
  before_action :current_page_user, only: [:star, :fork]

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    if @project.save_with_user(current_user)
      redirect_to project_path(current_user.username, @project.name)
    else
      render :new
    end
  end

  def star
    project = Project.find_by({user: @current_page_user, name: params[:project_name]})
    star_params = {user: current_user, project: project}

    status = "unstar"
    status = "star" unless Star.persisted?(star_params)
    render json: {status: status}
  end

  def fork

  end

  private
    def user_access
      render_404 unless user_signed_in?
    end

    def project_params
      params.require(:project).permit(:name, :url, :stylesheet)
    end
end
