class CreateStripeProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :stripe_products, id: :string do |t|
      t.string :name
      t.string :s_type
      t.boolean :active
      t.string :images, array: true
      t.string :object
      t.integer :created
      t.integer :updated
      t.boolean :livemode
      t.jsonb :metadata
      t.string :s_attributes, array: true
      t.string :unit_label
      t.text :description
      t.string :statement_descriptor

      t.timestamps
    end
  end
end
