class AddAttributesToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :name, :string
    add_column :users, :email, :string
    add_column :users, :password, :string
    add_column :users, :password_confirmation, :string
  end
end
