class AddUsernameToDevelopers < ActiveRecord::Migration
  def change
    add_column :developers, :username, :string
  end
end
