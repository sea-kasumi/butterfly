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

ActiveRecord::Schema.define(version: 20210120022013) do

  create_table "answers", force: :cascade do |t|
    t.integer "question_id"
    t.integer "user_id"
    t.string "answer"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "counselings", force: :cascade do |t|
    t.integer "hour_id"
    t.integer "user_id"
    t.integer "counsel_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "counsels", force: :cascade do |t|
    t.date "day"
    t.string "teacher"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.time "start_time"
    t.time "end_time"
  end

  create_table "healths", force: :cascade do |t|
    t.integer "user_id"
    t.float "temperature"
    t.string "condition"
    t.date "day"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "symptom_id"
  end

  create_table "hours", force: :cascade do |t|
    t.string "display"
    t.time "start_time"
    t.time "end_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "questions", force: :cascade do |t|
    t.string "user_id"
    t.string "question"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "symptoms", force: :cascade do |t|
    t.string "display"
    t.integer "disporder"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "account"
    t.string "password"
    t.integer "grade"
    t.integer "number"
    t.string "name"
    t.boolean "graduate"
    t.boolean "teacher"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "room"
  end

end
