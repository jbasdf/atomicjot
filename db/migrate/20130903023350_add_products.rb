class AddProducts < ActiveRecord::Migration
  def change

    create_table "merchants", :force => true do |t|
      t.string   "name"
      t.integer  "merchant_id"
      t.integer  "merchant_category_id"
      t.string   "merchant_category_name"
      t.string   "commission_action"
      t.string   "commission_type"
      t.string   "commission_rate"
      t.integer  "referral_days"
      t.integer  "reversal_days"
      t.string   "merchant_logo",          :limit => 2083
      t.string   "merchant_url",           :limit => 2083
      t.string   "available_tools",        :limit => 256
      t.string   "image",                  :limit => 2083
      t.boolean  "featured"
      t.string   "image_link",             :limit => 2083
      t.datetime "created_at",                             :null => false
      t.datetime "updated_at",                             :null => false
      t.string   "tiny_logo"
      t.string   "slug"
    end

    add_index "merchants", ["merchant_id"], :name => "index_merchants_on_merchant_id"
    add_index "merchants", ["slug"], :name => "index_merchants_on_slug", :unique => true

    create_table "products", :force => true do |t|
      t.integer  "data_feed_id"
      t.integer  "merchant_id"
      t.string   "external_id"
      t.string   "merchant_name"
      t.string   "sku"
      t.string   "manufacturer_id"
      t.string   "brand_name"
      t.string   "name"
      t.text     "description"
      t.string   "summary",          :limit => 2000
      t.string   "category"
      t.string   "subcategory"
      t.string   "group"
      t.string   "thumb_url",        :limit => 2083
      t.string   "image_url",        :limit => 2083
      t.string   "buy_link",         :limit => 2083
      t.string   "keywords"
      t.string   "reviews"
      t.float    "retail_price"
      t.float    "sale_price"
      t.float    "price"
      t.float    "comission"
      t.integer  "percent_discount"
      t.string   "brand_page_link",  :limit => 2083
      t.string   "brand_logo_image", :limit => 2083
      t.string   "cached_slug"
      t.datetime "price_changed_at"
      t.datetime "created_at",                       :null => false
      t.datetime "updated_at",                       :null => false
      t.datetime "deal_at"
      t.boolean  "deleted_at"
    end

    add_index "products", ["cached_slug"], :name => "index_products_on_cached_slug", :unique => true
    add_index "products", ["data_feed_id"], :name => "index_products_on_data_feed_id"
    add_index "products", ["merchant_id"], :name => "index_products_on_merchant_id"
    add_index "products", ["percent_discount"], :name => "index_products_on_percent_discount"
    add_index "products", ["price_changed_at"], :name => "index_products_on_price_changed_at"
    add_index "products", ["sku"], :name => "index_products_on_sku"

    create_table "sessions", :force => true do |t|
      t.string   "session_id", :null => false
      t.text     "data"
      t.datetime "created_at", :null => false
      t.datetime "updated_at", :null => false
    end

    add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
    add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

    create_table "taggings", :force => true do |t|
      t.integer  "tag_id"
      t.integer  "taggable_id"
      t.string   "taggable_type"
      t.integer  "tagger_id"
      t.string   "tagger_type"
      t.string   "context",       :limit => 128
      t.datetime "created_at"
    end

    add_index "taggings", ["tag_id"], :name => "index_taggings_on_tag_id"
    add_index "taggings", ["taggable_id", "taggable_type", "context"], :name => "index_taggings_on_taggable_id_and_taggable_type_and_context"

    create_table "tags", :force => true do |t|
      t.string "name"
    end
  end

end
