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

ActiveRecord::Schema.define(version: 20160919021250) do

  create_table "contracts", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.datetime "start_date"
    t.datetime "end_date"
    t.integer  "vendor_id"
    t.float    "customer_unit_price", limit: 24
    t.float    "vendor_unit_price",   limit: 24
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  create_table "customers", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.string   "shop_name",           limit: 100
    t.string   "address_line_1"
    t.string   "address_line_2"
    t.string   "address_line_3"
    t.string   "city",                limit: 50
    t.string   "taluk",               limit: 50
    t.string   "district",            limit: 50
    t.string   "state",               limit: 50
    t.string   "pin_code",            limit: 8
    t.string   "contact_number_1",    limit: 20
    t.string   "contact_number_2",    limit: 20
    t.string   "email"
    t.string   "website"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "is_tailors"
    t.string   "is_upstair"
    t.string   "is_opposite_or_near"
    t.string   "is_back_side_of"
  end

  create_table "orders", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "number"
    t.integer  "customer_id"
    t.integer  "vendor_id"
    t.datetime "booking_at"
    t.datetime "ready_for_production_at"
    t.datetime "dispatch_at"
    t.datetime "delivery_at"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string   "product_id"
    t.string   "units"
    t.datetime "expected_delivery_date"
    t.string   "notes"
  end

  create_table "products", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "product_name"
    t.string   "product_type"
    t.string   "product_size"
    t.string   "product_colour"
    t.integer  "contract_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "routes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "login",           limit: 45
    t.string   "password",        limit: 45
    t.string   "password_digest", limit: 45
    t.string   "name"
    t.string   "salt",            limit: 45
    t.string   "email"
    t.string   "mobile_number"
    t.datetime "created_at",                 default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "updated_at",                 default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["mobile_number"], name: "index_users_on_mobile_number", unique: true, using: :btree
  end

  create_table "vendors", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.string   "company_name",     limit: 100
    t.string   "address_line_1"
    t.string   "address_line_2"
    t.string   "address_line_3"
    t.string   "city",             limit: 50
    t.string   "taluk",            limit: 50
    t.string   "district",         limit: 50
    t.string   "state",            limit: 50
    t.string   "pin_code",         limit: 8
    t.string   "contact_number_1", limit: 20
    t.string   "contact_number_2", limit: 20
    t.string   "email"
    t.string   "website"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

end