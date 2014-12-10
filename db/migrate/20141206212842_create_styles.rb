class CreateStyles < ActiveRecord::Migration
  def change
    create_table :styles do |t|
      t.references  :project,  index: true

      t.text   :stylesheet
      t.text   :stylesheet_mini
      t.string :content_type

      t.timestamps
    end
  end
end
