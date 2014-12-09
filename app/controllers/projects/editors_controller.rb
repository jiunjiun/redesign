class Projects::EditorsController < Projects::AccessController
  before_filter :set_project
  before_action :project_data

  def index
  end

  def update
    redirect_to project_path(params[:username], params[:project_name]) if @project.update(project_params)
  end

  private
    def set_project
      @project = Project.find_by({user: @current_page_user, name: params[:project_name]})
    end

    def project_params
      params.require(:project).permit(style_attributes: [:stylesheet])
    end
end
