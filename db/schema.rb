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

ActiveRecord::Schema.define(version: 2019_07_11_144628) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "classrooms", id: :serial, force: :cascade do |t|
    t.integer "school_id"
    t.integer "room_no"
    t.integer "class_no"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["school_id"], name: "index_classrooms_on_school_id"
  end

  create_table "classrooms_teachers", id: false, force: :cascade do |t|
    t.integer "classroom_id"
    t.integer "teacher_id"
    t.index ["classroom_id"], name: "index_classrooms_teachers_on_classroom_id"
    t.index ["teacher_id"], name: "index_classrooms_teachers_on_teacher_id"
  end

  create_table "schools", id: :serial, force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "phone_no"
    t.string "code"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "students", id: :serial, force: :cascade do |t|
    t.integer "classroom_id"
    t.string "name"
    t.string "address"
    t.string "phone_no"
    t.string "gender"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["classroom_id"], name: "index_students_on_classroom_id"
  end

  create_table "teachers", id: :serial, force: :cascade do |t|
    t.integer "school_id"
    t.string "name"
    t.string "address"
    t.string "phone_no"
    t.string "gender"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["school_id"], name: "index_teachers_on_school_id"
  end

  add_foreign_key "classrooms", "schools"
  add_foreign_key "classrooms_teachers", "classrooms"
  add_foreign_key "classrooms_teachers", "teachers"
  add_foreign_key "students", "classrooms"
  add_foreign_key "teachers", "schools"
end
