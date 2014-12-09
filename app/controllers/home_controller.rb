class HomeController < ApplicationController
  before_action :current_page_user
  before_action :project_data, only: [:project]

  def index
    @projects = Project.where({user: @current_page_user})
    @stars_count = Star.where({user: @current_page_user}).size
  end

  def stars
    @stars = Star.where({user: @current_page_user})
    @stars_count = @stars.size
  end

  def project
    respond_to do |format|
      format.html
      format.css  {render text: @project.style.stylesheet, content_type: "text/css"}
    end
  end

  private
    def project_params
      params.require(:project).permit(:name, :url, :stylesheet)
    end

    def project_data
      @project            = Project.find_by({user: @current_page_user, name: params[:project_name]})
      @star               = Star.where({user: current_user, project: @project})
      @star_project_count = Star.where({project: @project}).size
    end
end
