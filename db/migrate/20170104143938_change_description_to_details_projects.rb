class ChangeDescriptionToDetailsProjects < ActiveRecord::Migration[5.0]
  def change
    rename_column :projects, :description, :details
  end
end
