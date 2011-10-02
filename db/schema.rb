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

ActiveRecord::Schema.define(:version => 20110930010433) do

  create_table "short_urls", :force => true do |t|
    t.text     "long_url"
    t.string   "url_hash"
    t.boolean  "private",    :default => false
    t.boolean  "spam",       :default => false
    t.boolean  "active",     :default => true
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "host"
  end

  create_table "statistics", :force => true do |t|
    t.string   "host"
    t.string   "host_with_port"
    t.string   "referrer"
    t.string   "path"
    t.string   "url_hash"
    t.string   "ip_address"
    t.string   "user_agent"
    t.string   "language"
    t.boolean  "processed"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "statistics", ["url_hash"], :name => "index_statistics_on_url_hash"

end
