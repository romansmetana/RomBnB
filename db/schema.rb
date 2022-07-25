# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_07_25_095508) do
  create_table "hotels", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.text "description"
    t.string "city"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id", null: false
    t.text "images"
    t.text "main_image"
  end

  create_table "hotels_labels", id: false, force: :cascade do |t|
    t.integer "hotel_id", null: false
    t.integer "label_id", null: false
    t.index ["hotel_id", "label_id"], name: "index_hotels_labels_on_hotel_id_and_label_id", unique: true
  end

  create_table "labels", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "icon"
  end

  create_table "resrvations", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "room_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["room_id"], name: "index_resrvations_on_room_id"
    t.index ["user_id"], name: "index_resrvations_on_user_id"
  end

  create_table "rooms", force: :cascade do |t|
    t.string "name"
    t.decimal "price", precision: 8, scale: 2
    t.integer "square"
    t.integer "capacity"
    t.integer "count"
    t.integer "double_bed"
    t.integer "single_bed"
    t.integer "hotel_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["hotel_id"], name: "index_rooms_on_hotel_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.boolean "owner", default: false
    t.string "avatar"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "resrvations", "rooms"
  add_foreign_key "resrvations", "users"
  add_foreign_key "rooms", "hotels"
end
