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

ActiveRecord::Schema.define(version: 20200310215054) do

  create_table "attendances", force: :cascade do |t|
    t.date "worked_on"
    t.datetime "started_at"
    t.datetime "finished_at"
    t.string "note"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "designated_work_start_time", default: "2020-03-15 01:00:00"
    t.datetime "designated_work_end_time", default: "2020-03-15 10:00:00"
    t.datetime "expected_end_time"
    t.string "next_day"
    t.string "business_processing_contents"
    t.string "instructor_confirmation"
    t.string "change_digest"
    t.index ["user_id"], name: "index_attendances_on_user_id"
  end

  create_table "bases", force: :cascade do |t|
    t.string "basename"
    t.string "basenumber"
    t.string "baseinfo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.string "remember_digest"
    t.boolean "admin", default: false
    t.string "department"
    t.datetime "basic_time", default: "2020-03-14 23:00:00"
    t.datetime "work_time", default: "2020-03-14 22:30:00"
    t.boolean "superior"
    t.integer "uid"
    t.integer "employee_number"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

end
