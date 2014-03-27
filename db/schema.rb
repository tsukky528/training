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

ActiveRecord::Schema.define(version: 20140326070519) do

  create_table "relationships", force: true do |t|
    t.integer  "user_id"
    t.integer  "like_movie_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "relationships", ["like_movie_id"], name: "index_relationships_on_like_movie_id"
  add_index "relationships", ["user_id", "like_movie_id"], name: "index_relationships_on_user_id_and_like_movie_id", unique: true
  add_index "relationships", ["user_id"], name: "index_relationships_on_user_id"

  create_table "trainings", force: true do |t|
    t.string   "movie"
    t.text     "explain"
    t.string   "muscle"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "youtube"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_token",  limit: nil
  end

end
