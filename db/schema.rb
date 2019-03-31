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

ActiveRecord::Schema.define(version: 2019_03_30_210850) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "animal_foods", force: :cascade do |t|
    t.integer "food_id"
    t.integer "count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "foods_id"
    t.bigint "animals_id"
    t.index ["animals_id"], name: "index_animal_foods_on_animals_id"
    t.index ["foods_id"], name: "index_animal_foods_on_foods_id"
  end

  create_table "animal_types", force: :cascade do |t|
    t.string "type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "animals", force: :cascade do |t|
    t.integer "type_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "users_id"
    t.bigint "animal_types_id"
    t.index ["animal_types_id"], name: "index_animals_on_animal_types_id"
    t.index ["users_id"], name: "index_animals_on_users_id"
  end

  create_table "foods", force: :cascade do |t|
    t.string "name"
    t.integer "calories"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "special_situations", force: :cascade do |t|
    t.string "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "animals_id"
    t.index ["animals_id"], name: "index_special_situations_on_animals_id"
  end

  create_table "terraria", force: :cascade do |t|
    t.float "temperature"
    t.float "humidity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "terrarium_enviroments", force: :cascade do |t|
    t.integer "terrarium_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "terraria_id"
    t.bigint "animals_id"
    t.index ["animals_id"], name: "index_terrarium_enviroments_on_animals_id"
    t.index ["terraria_id"], name: "index_terrarium_enviroments_on_terraria_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "animal_foods", "animals", column: "animals_id"
  add_foreign_key "animal_foods", "foods", column: "foods_id"
  add_foreign_key "animals", "animal_types", column: "animal_types_id"
  add_foreign_key "animals", "users", column: "users_id"
  add_foreign_key "special_situations", "animals", column: "animals_id"
  add_foreign_key "terrarium_enviroments", "animals", column: "animals_id"
  add_foreign_key "terrarium_enviroments", "terraria", column: "terraria_id"
end
