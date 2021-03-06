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

ActiveRecord::Schema.define(version: 2019_06_18_192440) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "unaccent"

  create_table "animal_foods", force: :cascade do |t|
    t.integer "count"
    t.time "time"
    t.bigint "animal_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "food_id"
    t.date "current_date"
    t.index ["animal_id", "created_at"], name: "index_animal_foods_on_animal_id_and_created_at"
    t.index ["animal_id"], name: "index_animal_foods_on_animal_id"
  end

  create_table "animal_types", force: :cascade do |t|
    t.string "animal_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "animals", force: :cascade do |t|
    t.string "name"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "animal_type_id"
    t.index ["user_id", "created_at"], name: "index_animals_on_user_id_and_created_at"
    t.index ["user_id"], name: "index_animals_on_user_id"
  end

  create_table "foods", force: :cascade do |t|
    t.string "name"
    t.integer "calories"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id", "created_at"], name: "index_foods_on_user_id_and_created_at"
    t.index ["user_id"], name: "index_foods_on_user_id"
  end

  create_table "home_enviroments", force: :cascade do |t|
    t.float "temperature"
    t.float "humidity"
    t.date "date"
    t.time "time"
    t.bigint "home_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["home_id", "created_at"], name: "index_home_enviroments_on_home_id_and_created_at"
    t.index ["home_id"], name: "index_home_enviroments_on_home_id"
  end

  create_table "homes", force: :cascade do |t|
    t.string "name"
    t.integer "size"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id", "created_at"], name: "index_homes_on_user_id_and_created_at"
    t.index ["user_id"], name: "index_homes_on_user_id"
  end

  create_table "notes", force: :cascade do |t|
    t.date "date"
    t.string "note"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_notes_on_user_id"
  end

  create_table "recurring_events", force: :cascade do |t|
    t.string "title"
    t.date "anchor"
    t.integer "frequency", limit: 2, default: 0
    t.string "color"
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
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "animal_foods", "animals"
  add_foreign_key "animals", "users"
  add_foreign_key "foods", "users"
  add_foreign_key "home_enviroments", "homes"
  add_foreign_key "homes", "users"
  add_foreign_key "notes", "users"
end
