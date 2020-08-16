class CreateStripeCustomers < ActiveRecord::Migration[6.1]
  def change
    create_table :stripe_customers, id: :string do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.string :object
      t.jsonb :address
      t.integer :balance
      t.integer :created
      t.jsonb :sources
      t.jsonb :tax_ids
      t.string :currency
      t.jsonb :discount
      t.boolean :livemode
      t.jsonb :metadata
      t.jsonb :shipping
      t.boolean :delinquent
      t.string :tax_exempt
      t.text :description
      t.jsonb :subscriptions
      t.string :default_source
      t.string :invoice_prefix
      t.jsonb :invoice_settings
      t.string :preferred_locales, array: true
      t.integer :next_invoice_sequence

      t.timestamps
    end
  end
end
