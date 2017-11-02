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

ActiveRecord::Schema.define(version: 20170921202153) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "basic_profiles", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "maiden_name"
    t.string   "formatted_name"
    t.string   "headline"
    t.string   "location"
    t.string   "industry"
    t.string   "summary"
    t.string   "specialties"
    t.string   "picture_url"
    t.string   "public_profile_url"
    t.integer  "user_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "books", force: :cascade do |t|
    t.string   "title",       limit: 32, null: false
    t.float    "price"
    t.integer  "subject_id"
    t.text     "description"
    t.datetime "created_at"
  end

  create_table "departments", force: :cascade do |t|
    t.string "name"
  end

  create_table "employees", force: :cascade do |t|
    t.string   "name",          limit: 32, null: false
    t.string   "email"
    t.integer  "department_id"
    t.string   "department"
    t.text     "description"
    t.datetime "created_at"
    t.string   "image"
  end

  create_table "employeeskills", force: :cascade do |t|
    t.integer  "employee_id"
    t.integer  "skill_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "emps", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "empskillqualities", force: :cascade do |t|
    t.integer  "emp_id"
    t.integer  "skillquality_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["emp_id"], name: "index_empskillqualities_on_emp_id", using: :btree
    t.index ["skillquality_id"], name: "index_empskillqualities_on_skillquality_id", using: :btree
  end

  create_table "empskills", force: :cascade do |t|
    t.integer  "employee_id"
    t.integer  "skill_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["employee_id"], name: "index_empskills_on_employee_id", using: :btree
    t.index ["skill_id"], name: "index_empskills_on_skill_id", using: :btree
  end

  create_table "full_profiles", force: :cascade do |t|
    t.string   "associations"
    t.string   "honors"
    t.string   "interests"
    t.integer  "user_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "hrs", force: :cascade do |t|
    t.string   "name",          limit: 32, null: false
    t.string   "email"
    t.integer  "department_id"
    t.string   "department"
    t.text     "description"
    t.datetime "created_at"
  end

  create_table "linkedin_oauth_settings", force: :cascade do |t|
    t.string   "atoken"
    t.string   "asecret"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "managers", force: :cascade do |t|
    t.string   "name",             limit: 32, null: false
    t.string   "email"
    t.integer  "department_id"
    t.string   "department"
    t.text     "description"
    t.datetime "created_at"
    t.string   "password"
    t.string   "confirm_password"
  end

  create_table "skillqualities", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "skills", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "name"
  end

  create_table "subjects", force: :cascade do |t|
    t.string "name"
  end

  create_table "users", force: :cascade do |t|
    t.string "email",            limit: 32, null: false
    t.string "password",         limit: 32, null: false
    t.string "confirm_password", limit: 32, null: false
    t.string "password_digest"
  end

  add_foreign_key "empskillqualities", "emps"
  add_foreign_key "empskillqualities", "skillqualities"
  add_foreign_key "empskills", "employees"
  add_foreign_key "empskills", "skills"
end
