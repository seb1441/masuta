# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_08_18_130741) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "action_text_rich_texts", force: :cascade do |t|
    t.string "name", null: false
    t.text "body"
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["record_type", "record_id", "name"], name: "index_action_text_rich_texts_uniqueness", unique: true
  end

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "categories", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.integer "position", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "chapters", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.integer "position", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "chat_messages", force: :cascade do |t|
    t.text "content"
    t.bigint "sender_id", null: false
    t.bigint "receiver_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["receiver_id"], name: "index_chat_messages_on_receiver_id"
    t.index ["sender_id"], name: "index_chat_messages_on_sender_id"
  end

  create_table "contact_messages", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.text "message"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "imports", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "lessons", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.bigint "category_id", null: false
    t.bigint "level_id", null: false
    t.bigint "chapter_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["category_id"], name: "index_lessons_on_category_id"
    t.index ["chapter_id"], name: "index_lessons_on_chapter_id"
    t.index ["level_id"], name: "index_lessons_on_level_id"
  end

  create_table "levels", force: :cascade do |t|
    t.string "title", null: false
    t.text "description"
    t.integer "position", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "roles", force: :cascade do |t|
    t.string "slug"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "scheduled_lessons", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.boolean "trial"
    t.integer "status"
    t.datetime "scheduled_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_scheduled_lessons_on_user_id"
  end

  create_table "stripe_customers", id: :string, force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "phone"
    t.string "object"
    t.jsonb "address"
    t.integer "balance"
    t.integer "created"
    t.jsonb "sources"
    t.jsonb "tax_ids"
    t.string "currency"
    t.jsonb "discount"
    t.boolean "livemode"
    t.jsonb "metadata"
    t.jsonb "shipping"
    t.boolean "delinquent"
    t.string "tax_exempt"
    t.text "description"
    t.jsonb "subscriptions"
    t.string "default_source"
    t.string "invoice_prefix"
    t.jsonb "invoice_settings"
    t.string "preferred_locales", array: true
    t.integer "next_invoice_sequence"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "stripe_prices", id: :string, force: :cascade do |t|
    t.string "s_type"
    t.boolean "active"
    t.string "object"
    t.integer "created"
    t.string "stripe_product_id", null: false
    t.string "currency"
    t.boolean "livemode"
    t.jsonb "metadata"
    t.string "nickname"
    t.jsonb "recurring"
    t.string "lookup_key"
    t.string "tiers_mode"
    t.integer "unit_amount"
    t.string "billing_scheme"
    t.jsonb "transform_quantity"
    t.integer "unit_amount_decimal"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["stripe_product_id"], name: "index_stripe_prices_on_stripe_product_id"
  end

  create_table "stripe_products", id: :string, force: :cascade do |t|
    t.string "name"
    t.string "s_type"
    t.boolean "active"
    t.string "images", array: true
    t.string "object"
    t.integer "created"
    t.integer "updated"
    t.boolean "livemode"
    t.jsonb "metadata"
    t.string "s_attributes", array: true
    t.string "unit_label"
    t.text "description"
    t.string "statement_descriptor"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "stripe_webhook_events", force: :cascade do |t|
    t.jsonb "data", null: false
    t.string "event_type", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "username"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.string "temporary_stripe_checkout_session_id"
    t.string "stripe_customer_id"
    t.integer "lesson_minutes", default: 0
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["stripe_customer_id"], name: "index_users_on_stripe_customer_id"
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true
  end

  create_table "users_roles", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "role_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["role_id"], name: "index_users_roles_on_role_id"
    t.index ["user_id"], name: "index_users_roles_on_user_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "chat_messages", "users", column: "receiver_id"
  add_foreign_key "chat_messages", "users", column: "sender_id"
  add_foreign_key "lessons", "categories"
  add_foreign_key "lessons", "chapters"
  add_foreign_key "lessons", "levels"
  add_foreign_key "scheduled_lessons", "users"
  add_foreign_key "stripe_prices", "stripe_products"
  add_foreign_key "users", "stripe_customers"
  add_foreign_key "users_roles", "roles"
  add_foreign_key "users_roles", "users"
end
