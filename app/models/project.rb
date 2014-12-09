class Project < ActiveRecord::Base
  belongs_to :user
  # belongs_to :form_user, class: 'User'

  belongs_to :from_project, class_name: :Project
  has_one    :projects, foreign_key: "from_project_id"

  has_one :style, :dependent => :destroy
  has_one :plugin, :dependent => :destroy
  has_one :star

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

  def fork(current_user)
    p = Project.new({user: current_user,
                    name: self.name,
                    url: self.url,
                    description: self.description,
                    from_project: self
                    })
    if p.save
      p.build_style
      p.style.stylesheet      = self.style.stylesheet
      p.style.stylesheet_mini = self.style.stylesheet_mini
      p.style.type            = self.style.type
      p.style.save
    end
    true
  end

  def url_format
    uri = URI(self.url)
    self.url = "#{uri.scheme}://#{uri.host}"
  end

  def css_file
    "#{user.username}/#{name}.css"
  end
end
