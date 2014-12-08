class Plugin < ActiveRecord::Base
  has_one :project, :dependent => :destroy
end
