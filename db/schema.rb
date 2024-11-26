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


ActiveRecord::Schema[7.1].define(version: 2024_11_26_155755) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"


  create_table "appointments", force: :cascade do |t|
    t.date "date"
    t.string "status"
    t.bigint "match_id", null: false
    t.bigint "user_id", null: false
    t.bigint "shelter_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["match_id"], name: "index_appointments_on_match_id"
    t.index ["shelter_id"], name: "index_appointments_on_shelter_id"
    t.index ["user_id"], name: "index_appointments_on_user_id"
  end

  create_table "conversations", force: :cascade do |t|
    t.bigint "match_id", null: false
    t.bigint "user_id", null: false
    t.bigint "shelter_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["match_id"], name: "index_conversations_on_match_id"
    t.index ["shelter_id"], name: "index_conversations_on_shelter_id"
    t.index ["user_id"], name: "index_conversations_on_user_id"
  end

  create_table "matches", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "pet_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pet_id"], name: "index_matches_on_pet_id"
    t.index ["user_id"], name: "index_matches_on_user_id"
  end

  create_table "messages", force: :cascade do |t|
    t.text "content"
    t.bigint "conversation_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["conversation_id"], name: "index_messages_on_conversation_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "pets", force: :cascade do |t|
    t.string "name"
    t.integer "age"
    t.string "category"
    t.text "description"
    t.string "gender"
    t.boolean "ok_cat"
    t.boolean "ok_dog"
    t.boolean "ok_kid"
    t.boolean "affectionate"
    t.text "behavior"
    t.string "size"
    t.text "needs"
    t.text "environment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "specie_id", null: false
    t.bigint "shelter_id", null: false
    t.index ["shelter_id"], name: "index_pets_on_shelter_id"
    t.index ["specie_id"], name: "index_pets_on_specie_id"
  end

  create_table "shelters", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.float "longitude"
    t.float "latitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "species", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.integer "age"
    t.string "gender"
    t.string "lifestyle"
    t.boolean "remote_work"
    t.string "address"
    t.string "green_space"
    t.integer "household_size"
    t.integer "time_for_pet"
    t.boolean "daily_walk"
    t.integer "pet_budget"
    t.boolean "have_children"
    t.boolean "have_cat"
    t.boolean "have_dog"
    t.boolean "have_other_pet"
    t.text "description"
    t.boolean "can_adopt_dog"
    t.boolean "can_adopt_cat"
    t.boolean "can_adopt_nac"
    t.bigint "shelter_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["shelter_id"], name: "index_users_on_shelter_id"
  end

  add_foreign_key "appointments", "matches"
  add_foreign_key "appointments", "shelters"
  add_foreign_key "appointments", "users"
  add_foreign_key "conversations", "matches"
  add_foreign_key "conversations", "shelters"
  add_foreign_key "conversations", "users"
  add_foreign_key "matches", "pets"
  add_foreign_key "matches", "users"
  add_foreign_key "messages", "conversations"
  add_foreign_key "messages", "users"
  add_foreign_key "pets", "shelters"
  add_foreign_key "pets", "species", column: "specie_id"
  add_foreign_key "users", "shelters"

end

