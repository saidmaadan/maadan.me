class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :name
      t.string :email
      t.text :remark
      t.integer :project_id

      t.timestamps null: false
    end
  end
end
