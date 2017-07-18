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

ActiveRecord::Schema.define(version: 20170717110439) do

  create_table "addresses", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name",       null: false
    t.string   "tel",        null: false
    t.string   "address",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.integer  "order_id"
    t.index ["order_id"], name: "index_addresses_on_order_id", using: :btree
    t.index ["user_id"], name: "index_addresses_on_user_id", using: :btree
  end

  create_table "carts", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "number",     null: false
    t.integer  "user_id",    null: false
    t.integer  "item_id",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_carts_on_item_id", using: :btree
    t.index ["user_id"], name: "index_carts_on_user_id", using: :btree
  end

  create_table "categories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "images", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "item_id",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "image_url"
    t.index ["item_id"], name: "index_images_on_item_id", using: :btree
  end

  create_table "items", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name",                       null: false
    t.integer  "price",                      null: false
    t.integer  "stock",                      null: false
    t.text     "introduction", limit: 65535, null: false
    t.integer  "category_id",                null: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.index ["category_id"], name: "index_items_on_category_id", using: :btree
  end

  create_table "orders", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id",                    null: false
    t.integer  "pay_type",                   null: false
    t.boolean  "check_out",  default: false, null: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.integer  "address_id",                 null: false
    t.index ["address_id"], name: "index_orders_on_address_id", using: :btree
    t.index ["user_id"], name: "index_orders_on_user_id", using: :btree
  end

  create_table "reviews", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "title",                                null: false
    t.text     "text",       limit: 65535,             null: false
    t.integer  "rate",                                 null: false
    t.integer  "user_id",                              null: false
    t.integer  "like",                     default: 0
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.integer  "item_id",                              null: false
    t.index ["item_id"], name: "index_reviews_on_item_id", using: :btree
    t.index ["user_id"], name: "index_reviews_on_user_id", using: :btree
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "name"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "carts", "items"
  add_foreign_key "carts", "users"
  add_foreign_key "images", "items"
  add_foreign_key "items", "categories"
  add_foreign_key "orders", "addresses"
  add_foreign_key "orders", "users"
  add_foreign_key "reviews", "users"
end
