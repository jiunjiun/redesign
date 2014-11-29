class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.references :user, index: true

      t.string :name
      t.string :url
      t.text   :stylesheet
      t.text   :stylesheet_mini

      t.timestamps
    end
  end
end
