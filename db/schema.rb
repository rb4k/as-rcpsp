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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130204102719) do

  create_table "demandsites", :force => true do |t|
    t.integer  "site_id"
    t.float    "demand_quantity"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "machine_periods", :force => true do |t|
    t.integer  "machine_id"
    t.integer  "period_id"
    t.float    "capacity"
    t.float    "overtime"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "machines", :force => true do |t|
    t.string   "name"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.float    "overtime_cost"
  end

  create_table "periods", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "product_machines", :force => true do |t|
    t.integer  "product_id"
    t.integer  "machine_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "product_periods", :force => true do |t|
    t.integer  "product_id"
    t.integer  "period_id"
    t.float    "demand"
    t.float    "production"
    t.float    "inventory"
    t.integer  "setup"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "product_products", :force => true do |t|
    t.integer  "from_product_id"
    t.integer  "to_product_id"
    t.integer  "coefficient"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "products", :force => true do |t|
    t.string   "name"
    t.float    "setup_time"
    t.float    "processing_time"
    t.float    "setup_cost"
    t.float    "holding_cost"
    t.float    "initial_inventory"
    t.integer  "lead_time_periods"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  create_table "sites", :force => true do |t|
    t.string   "name"
    t.string   "codename",   :limit => 3
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
  end

  create_table "supplysites", :force => true do |t|
    t.integer  "site_id"
    t.float    "supply_quantity"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "translinks", :force => true do |t|
    t.integer  "supplysite_id"
    t.integer  "demandsite_id"
    t.float    "unit_cost"
    t.float    "transport_quantity"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
    t.string   "password_digest"
    t.string   "remember_token"
    t.boolean  "admin",           :default => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["remember_token"], :name => "index_users_on_remember_token"

end
