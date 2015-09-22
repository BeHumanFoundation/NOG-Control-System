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

ActiveRecord::Schema.define(version: 20150914213528) do

  create_table "classes", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "faults", force: :cascade do |t|
    t.integer  "lesson_id"
    t.integer  "student_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "lessons", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "student_id"
    t.integer  "teacher_id"
    t.integer  "subject_id"
  end

  create_table "responsibles", force: :cascade do |t|
    t.string   "name"
    t.string   "phone"
    t.string   "email"
    t.string   "address"
    t.string   "cpf"
    t.date     "birthday"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "phone_job"
    t.string   "profession"
  end

  create_table "students", force: :cascade do |t|
    t.string   "name"
    t.string   "rg"
    t.string   "phone"
    t.string   "address"
    t.date     "birthday"
    t.string   "scholarity"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "responsible_id"
    t.integer  "lesson_id"
    t.integer  "subject_id"
  end

  create_table "students_subjects", force: :cascade do |t|
    t.integer "subject_id"
    t.integer "student_id"
  end

  create_table "subjects", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "lesson_id"
    t.integer  "student_id"
  end

  create_table "subjects_and_students_joins", force: :cascade do |t|
    t.integer "subject_id"
    t.integer "student_id"
  end

  create_table "teachers", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "cpf"
    t.string   "phone"
    t.string   "address"
    t.string   "cep"
    t.string   "profession"
    t.date     "birthday"
    t.string   "password_digest"
  end

end
