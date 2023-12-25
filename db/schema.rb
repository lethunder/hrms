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

ActiveRecord::Schema[7.1].define(version: 2023_12_25_170706) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "action_points", id: :serial, force: :cascade do |t|
    t.integer "person_id", null: false
    t.text "value"
    t.boolean "is_completed", default: false, null: false
    t.date "perform_on"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.string "updated_by_name"
    t.string "created_by_name"
    t.index ["person_id"], name: "index_action_points_on_person_id"
  end

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

  create_table "dayoffs", id: :serial, force: :cascade do |t|
    t.integer "person_id", null: false
    t.string "type"
    t.text "notes"
    t.integer "days", default: 1, null: false
    t.date "start_on"
    t.date "end_on"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.string "updated_by_name"
    t.string "created_by_name"
    t.index ["person_id"], name: "index_dayoffs_on_person_id"
  end

  create_table "events", id: :serial, force: :cascade do |t|
    t.string "entity_type", null: false
    t.integer "entity_id", null: false
    t.jsonb "params", default: "{}", null: false
    t.string "action", default: "", null: false
    t.integer "user_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["entity_id"], name: "index_events_on_entity_id"
    t.index ["entity_type"], name: "index_events_on_entity_type"
    t.index ["params"], name: "index_events_on_params", using: :gin
    t.index ["user_id"], name: "index_events_on_user_id"
  end

  create_table "expenses", force: :cascade do |t|
    t.bigint "person_id", null: false
    t.string "type", default: "Other", null: false
    t.text "notes", default: "", null: false
    t.integer "amount", null: false
    t.date "recorded_on"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.string "updated_by_name"
    t.string "created_by_name"
    t.index ["person_id"], name: "index_expenses_on_person_id"
  end

  create_table "notes", id: :serial, force: :cascade do |t|
    t.integer "person_id", null: false
    t.string "type", default: "Other", null: false
    t.text "value"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.string "updated_by_name"
    t.string "created_by_name"
    t.index ["person_id"], name: "index_notes_on_person_id"
  end

  create_table "people", id: :serial, force: :cascade do |t|
    t.string "name", null: false
    t.string "city"
    t.string "phone"
    t.string "skype"
    t.string "linkedin"
    t.string "primary_tech"
    t.string "english"
    t.date "day_of_birth"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.string "email"
    t.string "status", default: "n/a", null: false
    t.boolean "is_deleted", default: false, null: false
    t.integer "action_points_count", default: 0
    t.integer "attachments_count", default: 0
    t.integer "notes_count", default: 0
    t.string "expected_salary"
    t.date "start_date"
    t.string "source"
    t.integer "vacation_override"
    t.string "photo_id"
    t.string "photo_filename"
    t.integer "photo_size"
    t.string "photo_content_type"
    t.text "skills"
    t.date "finish_date"
    t.string "current_position"
    t.boolean "signed_nda", default: false, null: false
    t.string "salary_type"
    t.string "employee_id"
    t.date "last_one_on_one_meeting_at"
    t.date "last_performance_review_at"
    t.date "next_performance_review_at"
    t.string "github"
    t.string "personal_email"
    t.string "updated_by_name"
    t.string "created_by_name"
    t.boolean "skip_reviews", default: false
    t.string "telegram"
    t.string "contractor_company_name"
    t.text "contractor_manager_contacts"
    t.index ["action_points_count"], name: "index_people_on_action_points_count"
    t.index ["attachments_count"], name: "index_people_on_attachments_count"
    t.index ["is_deleted"], name: "index_people_on_is_deleted"
    t.index ["notes_count"], name: "index_people_on_notes_count"
    t.index ["status"], name: "index_people_on_status"
  end

  create_table "project_notes", force: :cascade do |t|
    t.integer "project_id", null: false
    t.text "value"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.string "updated_by_name"
    t.string "created_by_name"
    t.index ["project_id"], name: "index_project_notes_on_project_id"
  end

  create_table "projects", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "status", default: "active", null: false
    t.date "started_at"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.integer "project_notes_count", default: 0
    t.string "updated_by_name"
    t.string "created_by_name"
  end

  create_table "searches", id: :serial, force: :cascade do |t|
    t.string "query"
    t.string "path"
    t.string "ip"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
  end

  create_table "taggings", id: :serial, force: :cascade do |t|
    t.integer "tag_id"
    t.string "taggable_type"
    t.integer "taggable_id"
    t.string "tagger_type"
    t.integer "tagger_id"
    t.string "context", limit: 128
    t.datetime "created_at", precision: nil
    t.index ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true
    t.index ["tag_id"], name: "index_taggings_on_tag_id"
    t.index ["taggable_id", "taggable_type", "context"], name: "index_taggings_on_taggable_id_and_taggable_type_and_context"
    t.index ["taggable_id", "taggable_type", "tag_id"], name: "index_taggings_on_taggable_id_and_taggable_type_and_tag_id"
  end

  create_table "tags", id: :serial, force: :cascade do |t|
    t.string "name"
    t.integer "taggings_count", default: 0
    t.index ["name"], name: "index_tags_on_name", unique: true
  end

  create_table "users", id: :serial, force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at", precision: nil
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.boolean "notifications_enabled", default: true, null: false
    t.string "hide_tags", default: [], array: true
    t.string "hide_statuses", default: [], array: true
    t.boolean "has_access_to_finances", default: false
    t.boolean "has_access_to_events", default: false
    t.boolean "has_access_to_users", default: false
    t.boolean "employee_notifications_enabled", default: false
    t.boolean "has_access_to_expenses", default: false
    t.boolean "has_access_to_dayoffs", default: false
    t.boolean "has_access_to_performance", default: false
    t.string "updated_by_name"
    t.string "created_by_name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "vacancies", id: :serial, force: :cascade do |t|
    t.string "project"
    t.string "role"
    t.text "description"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.string "tag"
    t.string "status", default: "open"
    t.string "updated_by_name"
    t.string "created_by_name"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
end
