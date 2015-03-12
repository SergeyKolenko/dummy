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

ActiveRecord::Schema.define(:version => 20150311153501) do

  create_table "business_entities", :force => true do |t|
    t.string   "name"
    t.string   "name_short"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "lead_source_groups", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "lead_sources", :force => true do |t|
    t.string   "name"
    t.integer  "lead_source_group_id"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
  end

  create_table "leads", :force => true do |t|
    t.integer  "interested_company_id"
    t.integer  "lead_source_id"
    t.string   "status"
    t.integer  "contract_id"
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
  end

end
