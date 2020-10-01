class AddDetailsToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :username, :string, null: false
    add_column :users, :password, :string, null: false
    add_column :users, :email, :string, null: false
  end
end
