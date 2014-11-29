class Projects::AccessController < ApplicationController
  before_action :access_user

  def access_user
    redirect_to project_path(@current_page_user.username, params[:project_name]) unless current_manage_user?
  end
end
