class PluginController < ApplicationController
  helper_method :not_found

  def index
    @projects = Project.where({user: current_user, url: params[:url]})
    respond_to do |format|
      format.html { not_found }
      format.json
    end
  end

  private
    def not_found
      raise ActionController::RoutingError.new('Not Found')
    end
end
