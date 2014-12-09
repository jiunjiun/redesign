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
    unless @project.nil?
      respond_to do |format|
        format.html {nil}
        format.css  {render text: @project.style.stylesheet, content_type: "text/css"}
      end
    else
      respond_to do |format|
        format.html {render_404}
        format.css  {render text: nil, content_type: "text/css"}
      end
    end
  end

  private
    def project_params
      params.require(:project).permit(:name, :url, :stylesheet)
    end
end
