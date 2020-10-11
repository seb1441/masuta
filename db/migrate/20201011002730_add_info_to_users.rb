class AddInfoToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :city, :string
    add_column :users, :country, :string
    add_column :users, :convenient_weekdays, :string
    add_column :users, :convenient_hours, :string
    add_column :users, :skype_id, :string
    add_column :users, :level, :string
    add_column :users, :note, :string
  end
end
