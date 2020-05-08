class AddConstraintToUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :email
    remove_column :users, :created_at
    remove_column :users, :updated_at
    add_column :users, :email, :string, null: false
    add_column :users, :created_at, :datetime, null: false
    add_column :users, :updated_at, :datetime, null: false
    add_index :users, :email, unique: true
  end
end