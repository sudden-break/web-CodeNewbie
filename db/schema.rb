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

ActiveRecord::Schema.define(version: 20141017074515) do

  create_table "activities", force: true do |t|
    t.string   "category"
    t.integer  "content_id"
    t.string   "content_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "answers", force: true do |t|
    t.datetime "date"
    t.string   "topic"
    t.string   "flag"
    t.integer  "tweet_id"
    t.integer  "question_id"
    t.string   "author"
  end

  add_index "answers", ["tweet_id"], name: "index_answers_on_tweet_id", unique: true

  create_table "blogs", force: true do |t|
    t.string   "title"
    t.text     "body"
    t.string   "slug"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "excerpt"
  end

  create_table "challenges", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "link"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug"
    t.boolean  "current"
    t.text     "source"
    t.string   "hashtag"
  end

  add_index "challenges", ["slug"], name: "index_challenges_on_slug", unique: true

  create_table "chat_sessions", force: true do |t|
    t.string   "week"
    t.datetime "start_date"
  end

  create_table "chats", force: true do |t|
    t.text     "description"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug"
    t.date     "date"
    t.text     "tweet"
    t.text     "favorite_tweets"
    t.text     "resources"
    t.string   "image"
    t.integer  "guest_id"
  end

  add_index "chats", ["guest_id"], name: "index_chats_on_guest_id"

  create_table "delayed_jobs", force: true do |t|
    t.integer  "priority",   default: 0, null: false
    t.integer  "attempts",   default: 0, null: false
    t.text     "handler",                null: false
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "delayed_jobs", ["priority", "run_at"], name: "delayed_jobs_priority"

  create_table "friendly_id_slugs", force: true do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
  add_index "friendly_id_slugs", ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
  add_index "friendly_id_slugs", ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id"
  add_index "friendly_id_slugs", ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type"

  create_table "guests", force: true do |t|
    t.string   "first_name"
    t.string   "full_name"
    t.string   "job_title"
    t.string   "company"
    t.text     "bio"
    t.string   "twitter"
    t.string   "github"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "other_links", default: "--- []\n"
  end

  create_table "jobs", force: true do |t|
    t.string   "company"
    t.string   "name"
    t.string   "link"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "picks", force: true do |t|
    t.string   "name"
    t.string   "link"
    t.integer  "podcast_id"
    t.integer  "guest_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "picks", ["guest_id"], name: "index_picks_on_guest_id"
  add_index "picks", ["podcast_id"], name: "index_picks_on_podcast_id"

  create_table "podcasts", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "published_on"
    t.text     "audio_link"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug"
    t.string   "jw_player_id"
    t.integer  "episode_number"
    t.string   "image_link"
  end

  create_table "questions", force: true do |t|
    t.datetime "date"
    t.string   "topic"
    t.string   "flag"
    t.integer  "tweet_id"
    t.integer  "chat_session_id"
  end

  add_index "questions", ["tweet_id"], name: "index_questions_on_tweet_id", unique: true

  create_table "resources", force: true do |t|
    t.string   "name"
    t.string   "link"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "show_guests", force: true do |t|
    t.integer  "podcast_id"
    t.integer  "guest_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "show_guests", ["guest_id"], name: "index_show_guests_on_guest_id"
  add_index "show_guests", ["podcast_id"], name: "index_show_guests_on_podcast_id"

  create_table "show_notes", force: true do |t|
    t.string   "link"
    t.string   "name"
    t.integer  "podcast_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "show_notes", ["podcast_id"], name: "index_show_notes_on_podcast_id"

  create_table "taggings", force: true do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context",       limit: 128
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true

  create_table "tags", force: true do |t|
    t.string  "name"
    t.integer "taggings_count", default: 0
  end

  add_index "tags", ["name"], name: "index_tags_on_name", unique: true

  create_table "twitter_accounts", force: true do |t|
    t.string   "handle"
    t.integer  "followers_count"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "twitter_accounts", ["user_id"], name: "index_twitter_accounts_on_user_id"

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.string   "avatar"
    t.string   "username"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
