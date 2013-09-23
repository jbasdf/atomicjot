# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20130921230038) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "associations", force: true do |t|
    t.integer  "user_id"
    t.integer  "merchant_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "associations", ["merchant_id"], name: "index_associations_on_merchant_id", using: :btree
  add_index "associations", ["user_id"], name: "index_associations_on_user_id", using: :btree

  create_table "merchants", force: true do |t|
    t.string   "name"
    t.integer  "merchant_id"
    t.integer  "merchant_category_id"
    t.string   "merchant_category_name"
    t.string   "commission_action"
    t.string   "commission_type"
    t.string   "commission_rate"
    t.integer  "referral_days"
    t.integer  "reversal_days"
    t.string   "merchant_logo",          limit: 2083
    t.string   "merchant_url",           limit: 2083
    t.string   "available_tools",        limit: 256
    t.string   "image",                  limit: 2083
    t.boolean  "featured"
    t.string   "image_link",             limit: 2083
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "tiny_logo"
    t.string   "slug"
  end

  add_index "merchants", ["merchant_id"], name: "index_merchants_on_merchant_id", using: :btree
  add_index "merchants", ["slug"], name: "index_merchants_on_slug", unique: true, using: :btree

  create_table "product_connections", force: true do |t|
    t.integer  "product_id"
    t.integer  "product_group_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "product_connections", ["product_id", "product_group_id"], name: "index_product_connections_on_product_id_and_product_group_id", using: :btree

  create_table "product_groups", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "products", force: true do |t|
    t.integer  "data_feed_id"
    t.integer  "merchant_id"
    t.string   "sku"
    t.string   "manufacturer_id"
    t.string   "brand_name"
    t.string   "name"
    t.text     "description"
    t.string   "summary",          limit: 2000
    t.string   "category"
    t.string   "subcategory"
    t.string   "group"
    t.string   "thumb_url",        limit: 2083
    t.string   "image_url",        limit: 2083
    t.string   "buy_link",         limit: 2083
    t.string   "keywords"
    t.string   "reviews"
    t.float    "retail_price"
    t.float    "sale_price"
    t.float    "price"
    t.integer  "percent_discount"
    t.string   "brand_page_link",  limit: 2083
    t.string   "brand_logo_image", limit: 2083
    t.string   "cached_slug"
    t.datetime "price_changed_at"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.datetime "deal_at"
    t.boolean  "deleted_at"
  end

  add_index "products", ["cached_slug"], name: "index_products_on_cached_slug", unique: true, using: :btree
  add_index "products", ["data_feed_id"], name: "index_products_on_data_feed_id", using: :btree
  add_index "products", ["merchant_id"], name: "index_products_on_merchant_id", using: :btree
  add_index "products", ["percent_discount"], name: "index_products_on_percent_discount", using: :btree
  add_index "products", ["price_changed_at"], name: "index_products_on_price_changed_at", using: :btree
  add_index "products", ["sku"], name: "index_products_on_sku", using: :btree

  create_table "roles", force: true do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "roles", ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id", using: :btree
  add_index "roles", ["name"], name: "index_roles_on_name", using: :btree

  create_table "sessions", force: true do |t|
    t.string   "session_id", null: false
    t.text     "data"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "sessions", ["session_id"], name: "index_sessions_on_session_id", using: :btree
  add_index "sessions", ["updated_at"], name: "index_sessions_on_updated_at", using: :btree

  create_table "taggings", force: true do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context",       limit: 128
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id"], name: "index_taggings_on_tag_id", using: :btree
  add_index "taggings", ["taggable_id", "taggable_type", "context"], name: "index_taggings_on_taggable_id_and_taggable_type_and_context", using: :btree

  create_table "tags", force: true do |t|
    t.string "name"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: ""
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.string   "invitation_token"
    t.datetime "invitation_created_at"
    t.datetime "invitation_sent_at"
    t.datetime "invitation_accepted_at"
    t.integer  "invitation_limit"
    t.integer  "invited_by_id"
    t.string   "invited_by_type"
    t.integer  "affiliate_id"
    t.string   "auth_key"
    t.string   "amazon_associate_id"
    t.string   "commission_junction_id"
    t.string   "affiliatefuture_id"
    t.string   "affiliate_window_id"
    t.string   "authentication_token"
  end

  add_index "users", ["affiliate_id", "auth_key"], name: "index_users_on_affiliate_id_and_auth_key", using: :btree
  add_index "users", ["authentication_token"], name: "index_users_on_authentication_token", using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["invitation_token"], name: "index_users_on_invitation_token", unique: true, using: :btree
  add_index "users", ["invited_by_id"], name: "index_users_on_invited_by_id", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "users_roles", id: false, force: true do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "users_roles", ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id", using: :btree

  create_table "websites", force: true do |t|
    t.integer  "user_id"
    t.string   "external_id"
    t.string   "name"
    t.string   "url",         limit: 2048
    t.string   "jot"
    t.string   "theme"
    t.string   "logo"
    t.string   "css"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "websites", ["jot"], name: "index_websites_on_jot", using: :btree
  add_index "websites", ["url"], name: "index_websites_on_url", using: :btree

end
