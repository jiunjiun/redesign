class CreatePlugins < ActiveRecord::Migration
  def change
    create_table :plugins do |t|
      t.references  :project,  index: true

      t.text        :name
      t.string      :version

      t.timestamps
    end
  end
end
