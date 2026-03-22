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

ActiveRecord::Schema[8.1].define(version: 2026_03_22_191204) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "guests", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "full_name", null: false
    t.datetime "updated_at", null: false
    t.index ["full_name"], name: "index_guests_on_full_name"
  end

  create_table "rsvps", force: :cascade do |t|
    t.boolean "attending", null: false
    t.datetime "created_at", null: false
    t.text "dietary_requirements"
    t.string "email", null: false
    t.boolean "event_1_attending", null: false
    t.boolean "event_2_attending", null: false
    t.boolean "event_3_attending", null: false
    t.bigint "guest_id", null: false
    t.text "notes"
    t.datetime "updated_at", null: false
    t.index ["guest_id"], name: "index_rsvps_on_guest_id"
  end

  add_foreign_key "rsvps", "guests"
end
