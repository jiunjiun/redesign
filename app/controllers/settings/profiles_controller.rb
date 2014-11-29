class Settings::ProfilesController < AdminController
  before_filter :set_profile

  def index
  end

  def create
    if @profile.update(profile_params)
      redirect_to settings_profiles_path
    else
      render :index
    end
  end

  private
    def set_profile
      @profile = User.find(current_user.id)
    end

    def profile_params
      params.require(:user).permit(:username, :name, :email)
    end
end
