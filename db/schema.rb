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

ActiveRecord::Schema.define(version: 20160323213753) do

  create_table "api_keys", force: :cascade do |t|
    t.string   "access_token"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "repositories", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "name"
    t.string   "full_name"
    t.string   "description"
    t.boolean  "private"
    t.boolean  "fork"
    t.string   "url"
    t.string   "html_url"
    t.string   "archive_url"
    t.string   "assignees_url"
    t.string   "collaborators_url"
    t.string   "commits_url"
    t.string   "contributors_url"
    t.string   "forks_url"
    t.string   "homepage"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "repositories", ["user_id"], name: "index_repositories_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "login"
    t.string   "avatar_url"
    t.string   "url"
    t.string   "html_url"
    t.string   "repos_url"
    t.string   "type"
    t.string   "public_repos"
    t.string   "company"
    t.string   "following"
    t.string   "location"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

end
