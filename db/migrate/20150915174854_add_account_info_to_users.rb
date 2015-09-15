class AddAccountInfoToUsers < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :nickname, :string
    add_column :users, :github_url, :string
    add_column :users, :image_url, :string
  end
end
