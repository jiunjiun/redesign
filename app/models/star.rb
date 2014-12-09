class Star < ActiveRecord::Base
  belongs_to :user
  belongs_to :project

  validates_uniqueness_of :user_id, scope: :project_id

  def self.persisted?(star_params)
    star = where(star_params)
    unless star.exists?
      Star.create(star_params)
      false
    else
      Star.destroy_all(star_params)
    end
  end
end
