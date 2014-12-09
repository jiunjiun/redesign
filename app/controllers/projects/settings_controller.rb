class Projects::SettingsController < Projects::AccessController
  before_action :set_project
  before_action :project_data

  def index
  end

  def update
    flash[:finish] = true if @project.update(project_params)
    render :index
  end

  def destroy
    @project.delete
    redirect_to home_path
  end

  private
    def set_project
      @project = Project.find_by({user: @current_page_user, name: params[:project_name]})
    end

    def project_params
      params.require(:project).permit(:url, :name)
    end
end
