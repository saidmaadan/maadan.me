class AddFieldsToDevelopers < ActiveRecord::Migration
  def change
    add_column :developers, :slug, :string
    add_index :developers, :slug, unique: true
    add_column :developers, :auth_token, :string
  end
end
