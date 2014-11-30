class HomeController < ApplicationController
  before_action :current_page_user

  def index
    @projects = Project.where({user: @current_page_user})
  end

  def project
    @project = Project.find_by({user: @current_page_user, name: params[:project_name]})
    respond_to do |format|
      format.html
      format.css  {render text: @project.stylesheet, content_type: "text/css"}
    end
  end

  private
    def project_params
      params.require(:project).permit(:name, :url, :stylesheet)
    end
end
