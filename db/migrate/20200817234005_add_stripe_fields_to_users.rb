class AddStripeFieldsToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :temporary_stripe_checkout_session_id, :string
    add_reference :users, :stripe_customer, foreign_key: true, type: :string
    add_column :users, :lesson_minutes, :integer, default: 0
  end
end
