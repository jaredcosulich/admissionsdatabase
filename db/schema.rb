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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20140414204726) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: true do |t|
    t.string "street1"
    t.string "street2"
    t.string "city"
    t.string "zipcode"
    t.string "state",   default: "CA"
  end

  create_table "enrollments", force: true do |t|
    t.integer "student_id"
    t.date    "start"
    t.date    "end"
    t.text    "comments"
  end

  create_table "families", force: true do |t|
    t.integer "address_id"
    t.string  "parent_1_name"
    t.string  "parent_2_name"
    t.string  "email"
    t.string  "phone_number"
    t.integer "newsletter_option_id"
    t.text    "comments"
  end

  create_table "newsletter_options", force: true do |t|
    t.string "name"
  end

  create_table "point_of_contact_types", force: true do |t|
    t.string "name"
  end

  create_table "point_of_contacts", force: true do |t|
    t.integer "family_id"
    t.integer "point_of_contact_type_id"
    t.date    "date"
    t.string  "comments"
  end

  create_table "referral_options", force: true do |t|
    t.string "name"
  end

  create_table "referrals", force: true do |t|
    t.integer "family_id"
    t.string  "type"
    t.integer "referral_option_id"
    t.text    "comments"
  end

  create_table "students", force: true do |t|
    t.string   "name"
    t.string   "phone_number"
    t.string   "email"
    t.string   "gender"
    t.date     "birthmonth"
    t.boolean  "graduated",       default: false
    t.date     "graduation_date"
    t.integer  "address_id"
    t.integer  "family_id"
    t.text     "comments"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
