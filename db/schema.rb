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

ActiveRecord::Schema.define(version: 2019_04_30_072517) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

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

  create_table "special_situations", force: :cascade do |t|
    t.string "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "terraria", force: :cascade do |t|
    t.float "temperature"
    t.float "humidity"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id", "created_at"], name: "index_terraria_on_user_id_and_created_at"
    t.index ["user_id"], name: "index_terraria_on_user_id"
  end

  create_table "terrarium_enviroments", force: :cascade do |t|
    t.bigint "terraria_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["terraria_id", "created_at"], name: "index_terrarium_enviroments_on_terraria_id_and_created_at"
    t.index ["terraria_id"], name: "index_terrarium_enviroments_on_terraria_id"
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
  add_foreign_key "terraria", "users"
  add_foreign_key "terrarium_enviroments", "terraria", column: "terraria_id"
end
