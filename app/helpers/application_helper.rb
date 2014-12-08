module ApplicationHelper
  def sign_scenery_bg
    images = Dir.glob("app/assets/images/scenery/*").map { |path| path.split('/').last }
    "scenery/#{images[rand(images.size)]}"
  end
end
