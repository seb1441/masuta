class EditUsersTable < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :city
    remove_column :users, :country
    add_column :users, :timezone, :string
  end
end
