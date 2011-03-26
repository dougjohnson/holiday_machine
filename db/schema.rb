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

ActiveRecord::Schema.define(:version => 20110326163308) do

  create_table "admins", :force => true do |t|
    t.string   "email",                             :default => "", :null => false
    t.string   "encrypted_password", :limit => 128, :default => "", :null => false
    t.string   "password_salt",                     :default => "", :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "days_leave"
  end

  create_table "bank_holidays", :force => true do |t|
    t.string   "name"
    t.date     "date_of_hol"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "holiday_statuses", :force => true do |t|
    t.string   "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "holiday_years", :force => true do |t|
    t.date     "date_start"
    t.date     "date_end"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "description"
  end

  create_table "settings", :force => true do |t|
    t.integer  "year_start_day"
    t.integer  "year_start_month"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_days", :force => true do |t|
    t.integer  "user_id"
    t.integer  "no_days"
    t.string   "reason",          :limit => 100
    t.integer  "holiday_year_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_types", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                               :default => "", :null => false
    t.string   "encrypted_password",   :limit => 128, :default => "", :null => false
    t.string   "password_salt",                       :default => "", :null => false
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "reset_password_token"
    t.string   "remember_token"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                       :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.integer  "failed_attempts",                     :default => 0
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "authentication_token"
    t.integer  "days_leave"
    t.integer  "user_type_id",         :limit => 255
    t.integer  "manager_id"
    t.string   "forename",             :limit => 80
    t.string   "surname",              :limit => 80
  end

  create_table "vacations", :force => true do |t|
    t.date     "date_from"
    t.date     "date_to"
    t.string   "description"
    t.integer  "working_days_used"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "holiday_status_id"
    t.integer  "user_id"
    t.integer  "manager_id"
    t.text     "notes"
    t.string   "uuid"
    t.integer  "holiday_year_id"
  end

end
