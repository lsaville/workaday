class CreateProjects < ActiveRecord::Migration[5.0]
  def change
    create_table :projects do |t|
      t.numeric :lat
      t.numeric :lng
      t.text :title
      t.text :description

      t.timestamps
    end
  end
end
