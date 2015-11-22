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

ActiveRecord::Schema.define(version: 20151118073233) do

  create_table "admins", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
  end

  add_index "admins", ["email"], name: "index_admins_on_email", unique: true, using: :btree
  add_index "admins", ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true, using: :btree

  create_table "game_boards", force: :cascade do |t|
    t.string   "name",             limit: 256,             null: false
    t.integer  "status",           limit: 1,               null: false
    t.integer  "turn",             limit: 1,               null: false
    t.integer  "total_boards",     limit: 8,   default: 0, null: false
    t.integer  "completed_boards", limit: 8,   default: 0, null: false
    t.integer  "draws",            limit: 8
    t.integer  "white_wins",       limit: 8
    t.integer  "black_wins",       limit: 8
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
  end

  create_table "pieces", force: :cascade do |t|
    t.integer  "kind",           limit: 1,  null: false
    t.integer  "color",          limit: 1,  null: false
    t.integer  "x",              limit: 1,  null: false
    t.integer  "y",              limit: 1,  null: false
    t.integer  "boardable_id",   limit: 4
    t.string   "boardable_type", limit: 50
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "pieces", ["boardable_id"], name: "index_pieces_on_boardable_id", using: :btree

  create_table "play_boards", force: :cascade do |t|
    t.integer  "turn",       limit: 1, null: false
    t.integer  "play_id",    limit: 4, null: false
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "play_boards", ["play_id"], name: "index_play_boards_on_play_id", using: :btree

  create_table "plays", force: :cascade do |t|
    t.integer  "value",         limit: 4, null: false
    t.integer  "game_board_id", limit: 4, null: false
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "plays", ["game_board_id"], name: "index_plays_on_game_board_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "play_boards", "plays"
  add_foreign_key "plays", "game_boards"
end
