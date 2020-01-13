# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_01_10_164120) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "follows", force: :cascade do |t|
    t.integer "user_id"
    t.integer "twitter_user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "tweets", force: :cascade do |t|
    t.string "twitter_created_at"
    t.integer "twitter_id"
    t.string "twitter_id_str"
    t.string "text"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "entities"
    t.string "hashtags"
    t.string "media"
    t.string "media_url"
    t.integer "twitter_user_id"
    t.string "twitter_user_id_str"
    t.string "twitter_user_name"
    t.string "twitter_user_screen_name"
    t.string "twitter_user_description"
    t.string "twitter_user_profile_image_url"
  end

  create_table "twitter_users", force: :cascade do |t|
    t.integer "twitter_id"
    t.string "twitter_id_str"
    t.string "name"
    t.string "screen_name"
    t.boolean "verified"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "profile_image_url"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
