class CreateStripeWebhookEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :stripe_webhook_events do |t|
      t.jsonb :data, null: false
      t.string :event_type, null: false

      t.timestamps
    end
  end
end
