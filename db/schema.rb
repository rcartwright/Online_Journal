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

ActiveRecord::Schema.define(version: 20160702055123) do

  create_table "blogs", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "blog_name"
    t.string   "slug"
    t.string   "status"
    t.text     "about"
  end

  add_index "blogs", ["slug"], name: "index_blogs_on_slug", unique: true

  create_table "comments", force: :cascade do |t|
    t.string   "comment"
    t.integer  "blog_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "post_id"
  end

  create_table "posts", force: :cascade do |t|
    t.string   "title"
    t.text     "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.integer  "blog_id"
  end

  create_table "styles", force: :cascade do |t|
    t.string   "layout",       default: "flat_layout"
    t.string   "header_image"
    t.string   "color_theme",  default: "sky_blue"
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.integer  "blog_id"
    t.string   "font_size",    default: "medium-font"
    t.string   "font_family",  default: "rachels-pick"
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.string   "remember_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "blog_id"
    t.string   "avatar"
  end

end
