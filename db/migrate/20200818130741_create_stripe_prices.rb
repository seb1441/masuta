class CreateStripePrices < ActiveRecord::Migration[6.1]
  def change
    create_table :stripe_prices, id: :string do |t|
      t.string :s_type
      t.boolean :active
      t.string :object
      t.integer :created
      t.references :stripe_product, null: false, foreign_key: true, type: :string
      t.string :currency
      t.boolean :livemode
      t.jsonb :metadata
      t.string :nickname
      t.jsonb :recurring
      t.string :lookup_key
      t.string :tiers_mode
      t.integer :unit_amount
      t.string :billing_scheme
      t.jsonb :transform_quantity
      t.integer :unit_amount_decimal

      t.timestamps
    end
  end
end
