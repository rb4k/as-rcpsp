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

ActiveRecord::Schema.define(:version => 20150310092848) do

  create_table "periods", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "procedure_procedures", :force => true do |t|
    t.integer  "prepro_id"
    t.integer  "sucpro_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "procedure_resources", :force => true do |t|
    t.integer  "resource_id"
    t.integer  "procedure_id"
    t.integer  "capa_demand"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "procedures", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "prot"
    t.integer  "fa"
    t.integer  "sa"
    t.integer  "fe"
    t.integer  "se"
  end

  create_table "projects", :force => true do |t|
    t.string   "name"
    t.string   "path"
    t.date     "deadline"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "zwt"
    t.integer  "zwc"
    t.integer  "totalc"
    t.integer  "extrac"
  end

  create_table "resources", :force => true do |t|
    t.string   "name"
    t.datetime "created_at",                :null => false
    t.integer  "oce",        :default => 0
    t.integer  "cost"
    t.integer  "ocr"
    t.datetime "updated_at",                :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.integer  "resource_id"
    t.integer  "capacity"
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
    t.string   "password_digest"
    t.string   "remember_token"
    t.boolean  "admin",           :default => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["remember_token"], :name => "index_users_on_remember_token"

end
