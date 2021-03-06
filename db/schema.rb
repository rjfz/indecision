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

ActiveRecord::Schema.define(version: 2022_02_08_152641) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.string "record_type"
    t.uuid "record_id"
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "anon_user_lobbies", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "lobby_id", null: false
    t.uuid "anon_user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["anon_user_id"], name: "index_anon_user_lobbies_on_anon_user_id"
    t.index ["lobby_id"], name: "index_anon_user_lobbies_on_lobby_id"
  end

  create_table "anon_users", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "username"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.uuid "user_id"
    t.index ["user_id"], name: "index_anon_users_on_user_id"
  end

  create_table "answers", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "question_id", null: false
    t.string "value"
    t.boolean "correct"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["question_id"], name: "index_answers_on_question_id"
  end

  create_table "courses", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "subject_id", null: false
    t.string "name"
    t.string "module_code"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["subject_id"], name: "index_courses_on_subject_id"
  end

  create_table "lessons", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "course_id", null: false
    t.string "name"
    t.integer "number"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["course_id"], name: "index_lessons_on_course_id"
  end

  create_table "lobbies", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "lesson_id", null: false
    t.string "room_code"
    t.datetime "session_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
    t.string "state"
    t.uuid "year_id", null: false
    t.index ["lesson_id"], name: "index_lobbies_on_lesson_id"
    t.index ["year_id"], name: "index_lobbies_on_year_id"
  end

  create_table "lobby_questions", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "lobby_id", null: false
    t.uuid "question_id", null: false
    t.string "state"
    t.datetime "started_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["lobby_id"], name: "index_lobby_questions_on_lobby_id"
    t.index ["question_id"], name: "index_lobby_questions_on_question_id"
  end

  create_table "questions", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "lesson_id", null: false
    t.string "title"
    t.integer "time_limit"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "question_type", null: false
    t.index ["lesson_id"], name: "index_questions_on_lesson_id"
  end

  create_table "responses", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "answer_id"
    t.uuid "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.uuid "lobby_question_id", null: false
    t.uuid "anon_user_id", null: false
    t.integer "points", default: 0
    t.string "answer_text"
    t.index ["anon_user_id"], name: "index_responses_on_anon_user_id"
    t.index ["answer_id"], name: "index_responses_on_answer_id"
    t.index ["lobby_question_id"], name: "index_responses_on_lobby_question_id"
    t.index ["user_id"], name: "index_responses_on_user_id"
  end

  create_table "role_permissions", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "role_id", null: false
    t.string "resource"
    t.string "action"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["role_id"], name: "index_role_permissions_on_role_id"
  end

  create_table "roles", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "subjects", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "user_subjects", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "user_id", null: false
    t.uuid "subject_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["subject_id"], name: "index_user_subjects_on_subject_id"
    t.index ["user_id"], name: "index_user_subjects_on_user_id"
  end

  create_table "users", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.uuid "role_id", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["role_id"], name: "index_users_on_role_id"
  end

  create_table "years", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "academic_year"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "anon_user_lobbies", "anon_users"
  add_foreign_key "anon_user_lobbies", "lobbies"
  add_foreign_key "anon_users", "users"
  add_foreign_key "answers", "questions"
  add_foreign_key "courses", "subjects"
  add_foreign_key "lessons", "courses"
  add_foreign_key "lobbies", "lessons"
  add_foreign_key "lobbies", "years"
  add_foreign_key "lobby_questions", "lobbies"
  add_foreign_key "lobby_questions", "questions"
  add_foreign_key "questions", "lessons"
  add_foreign_key "responses", "anon_users"
  add_foreign_key "responses", "answers"
  add_foreign_key "responses", "lobby_questions"
  add_foreign_key "responses", "users"
  add_foreign_key "role_permissions", "roles"
  add_foreign_key "user_subjects", "subjects"
  add_foreign_key "user_subjects", "users"
  add_foreign_key "users", "roles"
end
