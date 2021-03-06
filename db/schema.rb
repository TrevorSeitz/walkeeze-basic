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

ActiveRecord::Schema.define(version: 2018_11_13_200034) do

  create_table "dogs", force: :cascade do |t|
    t.string "name"
    t.string "breed"
    t.integer "age"
    t.integer "user_id"
    t.text "notes"
    t.string "image_file_name"
    t.string "image_content_type"
    t.integer "image_file_size"
    t.datetime "image_updated_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "dogs_walks", force: :cascade do |t|
    t.text "notes"
    t.integer "dog_id"
    t.integer "walk_id"
    t.index ["dog_id"], name: "index_dogs_walks_on_dog_id"
    t.index ["walk_id"], name: "index_dogs_walks_on_walk_id"
  end

  create_table "images", force: :cascade do |t|
    t.string "title"
    t.string "image_file_name"
    t.string "image_content_type"
    t.integer "image_file_size"
    t.datetime "image_updated_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "uid"
    t.string "image"
    t.string "password_digest"
    t.string "provider"
    t.string "image_file_name"
    t.string "image_content_type"
    t.integer "image_file_size"
    t.datetime "image_updated_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin", default: false
    t.boolean "walker", default: false
  end

  create_table "walkers", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "uid"
    t.string "image"
    t.string "password_digest"
    t.string "provider"
    t.string "image_file_name"
    t.string "image_content_type"
    t.bigint "image_file_size"
    t.datetime "image_updated_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "walks", force: :cascade do |t|
    t.string "walker_name"
    t.date "date"
    t.string "time"
    t.integer "length"
    t.integer "available_spots"
    t.text "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "walker_id"
  end

end
