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

ActiveRecord::Schema.define(:version => 20120416000424) do

  create_table "greeting_recipients", :force => true do |t|
    t.string   "recipient",      :null => false
    t.string   "recipient_type", :null => false
    t.integer  "greeting_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "greeting_recipients", ["greeting_id"], :name => "index_greeting_recipients_on_greeting_id"

  create_table "greeting_schedules", :force => true do |t|
    t.datetime "when",                                 :null => false
    t.integer  "recurrence_count",      :default => 1
    t.datetime "recurrence_end"
    t.datetime "next_occurrence"
    t.integer  "greeting_recipient_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "greeting_schedules", ["greeting_recipient_id"], :name => "index_greeting_schedules_on_greeting_recipient_id"

  create_table "greetings", :force => true do |t|
    t.text     "text",       :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "users_id"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
