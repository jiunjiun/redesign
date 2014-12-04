class Projects::ProjectController < ApplicationController
  before_action :set_project, only: [:edit, :update, :destroy]
  before_action :user_access

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

  private
    def user_access
      render_404 unless user_signed_in?
    end

    def set_project
      @project = Project.find_by({user: @current_page_user, name: params[:project_name]})
      redirect_to home_path(params[:username]) unless @project
    end

    def project_params
      params.require(:project).permit(:name, :url, :stylesheet)
    end
end
