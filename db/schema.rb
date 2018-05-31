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

ActiveRecord::Schema.define(version: 2018_05_31_121819) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "appointments", force: :cascade do |t|
    t.datetime "start_date"
    t.datetime "end_date"
    t.string "category"
    t.text "description"
    t.bigint "medical_professional_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["medical_professional_id"], name: "index_appointments_on_medical_professional_id"
    t.index ["user_id"], name: "index_appointments_on_user_id"
  end

  create_table "drugs", force: :cascade do |t|
    t.string "name"
    t.string "category"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "medical_professionals", force: :cascade do |t|
    t.string "location_name"
    t.string "address"
    t.string "phone"
    t.string "specialty"
    t.string "doctor"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "medical_records", force: :cascade do |t|
    t.date "record_date"
    t.string "title"
    t.string "category"
    t.text "description"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_medical_records_on_user_id"
  end

  create_table "photos", force: :cascade do |t|
    t.string "url"
    t.bigint "appointment_id"
    t.bigint "medical_record_id"
    t.bigint "prescription_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["appointment_id"], name: "index_photos_on_appointment_id"
    t.index ["medical_record_id"], name: "index_photos_on_medical_record_id"
    t.index ["prescription_id"], name: "index_photos_on_prescription_id"
  end

  create_table "prescriptions", force: :cascade do |t|
    t.datetime "start_date"
    t.datetime "end_date"
    t.bigint "medical_professional_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["medical_professional_id"], name: "index_prescriptions_on_medical_professional_id"
  end

  create_table "symptoms", force: :cascade do |t|
    t.string "name"
    t.integer "intensity"
    t.datetime "start_date"
    t.datetime "end_date"
    t.text "description"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_symptoms_on_user_id"
  end

  create_table "treatments", force: :cascade do |t|
    t.boolean "taken"
    t.datetime "take_time"
    t.string "quantity"
    t.bigint "prescription_id"
    t.bigint "drug_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["drug_id"], name: "index_treatments_on_drug_id"
    t.index ["prescription_id"], name: "index_treatments_on_prescription_id"
    t.index ["user_id"], name: "index_treatments_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "zipcode"
    t.date "birthday"
    t.string "sex"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "appointments", "medical_professionals"
  add_foreign_key "appointments", "users"
  add_foreign_key "medical_records", "users"
  add_foreign_key "photos", "appointments"
  add_foreign_key "photos", "medical_records"
  add_foreign_key "photos", "prescriptions"
  add_foreign_key "prescriptions", "medical_professionals"
  add_foreign_key "symptoms", "users"
  add_foreign_key "treatments", "drugs"
  add_foreign_key "treatments", "prescriptions"
  add_foreign_key "treatments", "users"
end
