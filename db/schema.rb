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

ActiveRecord::Schema.define(:version => 20110329154725) do

  create_table "alumni_meetings", :force => true do |t|
    t.integer  "alumni_id"
    t.integer  "meeting_id"
    t.boolean  "invited",    :default => false
    t.boolean  "status",     :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "alumnis", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.date     "birthday"
    t.string   "street"
    t.string   "city"
    t.string   "country"
    t.string   "phone"
    t.string   "email"
    t.string   "hashed_password"
    t.integer  "graduation_year"
    t.integer  "school_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
  end

  create_table "assets", :force => true do |t|
    t.string  "asset_file_name"
    t.string  "asset_content_type"
    t.integer "asset_file_size"
    t.date    "asset_updated_at"
    t.integer "meeting_id"
  end

  create_table "cities", :force => true do |t|
    t.string   "name"
    t.string   "state"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "comments", :force => true do |t|
    t.string   "body"
    t.string   "user"
    t.integer  "meeting_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "meetings", :force => true do |t|
    t.string   "location"
    t.string   "city"
    t.datetime "date"
    t.text     "description"
    t.integer  "school_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "graduation_year"
  end

  create_table "schools", :force => true do |t|
    t.string   "name"
    t.integer  "city_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
