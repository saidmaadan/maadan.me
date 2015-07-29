class AddRoleToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :roles, :text
  end
end
