class AddCommentsToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :comments, :string
  end
end
