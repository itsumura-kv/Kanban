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

ActiveRecord::Schema.define(version: 2018_11_13_033601) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cards", force: :cascade do |t|
    t.string "title"
    t.bigint "user_id"
    t.date "due_date"
    t.bigint "project_id"
    t.bigint "column_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["column_id"], name: "index_cards_on_column_id"
    t.index ["project_id"], name: "index_cards_on_project_id"
    t.index ["user_id"], name: "index_cards_on_user_id"
  end

  create_table "columns", force: :cascade do |t|
    t.string "title"
    t.bigint "project_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_columns_on_project_id"
  end

  create_table "invitations", force: :cascade do |t|
    t.integer "inviter"
    t.integer "invitee"
    t.bigint "project_id"
    t.boolean "has_read"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_invitations_on_project_id"
  end

  create_table "logs", force: :cascade do |t|
    t.string "content"
    t.bigint "project_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_logs_on_project_id"
  end

  create_table "project_users", force: :cascade do |t|
    t.bigint "project_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_project_users_on_project_id"
    t.index ["user_id"], name: "index_project_users_on_user_id"
  end

  create_table "projects", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.integer "admin_user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.string "uid"
    t.string "provider"
    t.string "name"
    t.string "image_path"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "cards", "columns"
  add_foreign_key "cards", "projects"
  add_foreign_key "cards", "users"
  add_foreign_key "columns", "projects"
  add_foreign_key "invitations", "projects"
  add_foreign_key "logs", "projects"
  add_foreign_key "project_users", "projects"
  add_foreign_key "project_users", "users"
end
