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

ActiveRecord::Schema.define(version: 20161202070715) do

  create_table "clients", force: :cascade do |t|
    t.string   "name"
    t.string   "counselor"
    t.string   "email"
    t.string   "phone_number"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "form_updated_at"
    t.string   "date_of_birth"
    t.string   "age"
    t.string   "gender"
    t.string   "address"
    t.string   "does_phone_number_have_texting"
    t.string   "alternate_phone_number"
    t.string   "occupation"
    t.string   "employer"
    t.string   "length_of_employment"
    t.string   "marital_status"
    t.string   "length_of_marriage"
    t.string   "spouses_name"
    t.string   "spouses_dob"
    t.string   "spouses_employed"
    t.string   "emergency_contact_name"
    t.string   "emergency_contact_relationship"
    t.string   "emergency_contact_phone_number"
    t.string   "emergency_contact_address"
    t.string   "religious_affiliation"
    t.string   "housemates"
    t.string   "physician"
    t.string   "date_of_last_physical_exam"
    t.string   "illnesses_injuries_disabilities"
    t.string   "medications"
    t.string   "medication_prescriber"
    t.string   "medication_prescriber_phone_number"
    t.string   "has_been_hospitalized"
    t.string   "hospitalization_info"
    t.string   "has_family_member_with_abuse_problem"
    t.string   "family_member_problem_explanation"
    t.string   "problems"
    t.string   "severity_of_problem"
    t.string   "problem_start_time"
    t.string   "has_received_counseling_before"
    t.string   "prior_counselor"
    t.string   "was_counseling_helpful"
    t.string   "list_of_problems"
    t.string   "how_they_heard_about_itph"
    t.string   "may_send_appt_emails"
    t.string   "may_send_general_emails"
    t.integer  "user_id"
  end

  add_index "clients", ["user_id"], name: "index_clients_on_user_id"

  create_table "clients_events", id: false, force: :cascade do |t|
    t.integer "client_id", null: false
    t.integer "event_id",  null: false
  end

  create_table "events", force: :cascade do |t|
    t.string   "title"
    t.string   "event_type"
    t.string   "date"
    t.string   "notes"
    t.boolean  "weekly"
    t.boolean  "biweekly"
    t.datetime "start"
    t.datetime "end"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "new_name"
    t.string   "new_email"
    t.integer  "room_id"
    t.boolean  "editable",   default: false
    t.string   "recurring"
  end

  add_index "events", ["room_id"], name: "index_events_on_room_id"

  create_table "events_users", id: false, force: :cascade do |t|
    t.integer "user_id",  null: false
    t.integer "event_id", null: false
  end

  create_table "rooms", force: :cascade do |t|
    t.string   "name"
    t.string   "color"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "phone_number"
    t.boolean  "admin",                  default: false
    t.string   "name"
    t.integer  "client_id"
  end

  add_index "users", ["client_id"], name: "index_users_on_client_id"
  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
