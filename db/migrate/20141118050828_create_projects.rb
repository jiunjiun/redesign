class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.references  :user, index: true

      t.string      :name
      t.string      :url
      t.string      :description

      t.references  :form_user, index: true

      t.timestamps
    end
  end
end
