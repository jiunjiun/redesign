class Project < ActiveRecord::Base
  belongs_to :user
  has_one :style, :dependent => :destroy
  has_one :plugin, :dependent => :destroy

  accepts_nested_attributes_for :style, :plugin

  validates_uniqueness_of :name, scope: :user_id
  validates_format_of :url, with: URI::regexp(%w(http https))
  validates_presence_of :name, :url

  before_save :url_format

  def save_with_user(current_user)
    self.user = current_user
    self.build_style.save
    save
  end

  def url_format
    uri = URI(self.url)
    self.url = "#{uri.scheme}://#{uri.host}"
  end

  def css_file
    "#{user.username}/#{name}.css"
  end
end
