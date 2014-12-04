class Project < ActiveRecord::Base
  belongs_to :user

  validates_uniqueness_of :name, scope: :user_id
  validates_format_of :url, with: URI::regexp(%w(http https))
  validates_presence_of :name, :url

  def save_with_user(current_user)
    self.user = current_user
    save
  end

  def css_file
    "#{user.username}/#{name}.css"
  end
end
