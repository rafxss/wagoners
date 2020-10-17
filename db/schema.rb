# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.




ActiveRecord::Schema.define(version: 2020_10_17_112653) do


  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "branch_offices", force: :cascade do |t|
    t.string "address"
    t.float "latitude"
    t.float "longitude"
    t.bigint "partner_id", null: false
    t.string "email"
    t.string "phone"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["partner_id"], name: "index_branch_offices_on_partner_id"
  end

  create_table "offers", force: :cascade do |t|
    t.bigint "partner_id", null: false
    t.string "description"
    t.float "voucher"
    t.integer "category"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.date "due_date"
    t.string "url"
    t.string "level"
    t.index ["partner_id"], name: "index_offers_on_partner_id"
  end

  create_table "partners", force: :cascade do |t|
    t.string "name"
    t.string "phone"
    t.string "email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.text "description"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "first_name"
    t.string "last_name"
    t.string "address"
    t.integer "point", default: 0
    t.boolean "geolocation_access"
    t.float "latitude"
    t.float "longitude"
    t.integer "category"
    t.date "date_of_birth"
    t.string "provider"
    t.string "uid"
    t.string "token"
    t.datetime "token_expiry"
    t.boolean "admin"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "users_to_offers", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "offer_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "used", default: false, null: false
    t.boolean "code_used", default: false, null: false
    t.index ["offer_id"], name: "index_users_to_offers_on_offer_id"
    t.index ["user_id"], name: "index_users_to_offers_on_user_id"
  end

  add_foreign_key "branch_offices", "partners"
  add_foreign_key "offers", "partners"
  add_foreign_key "users_to_offers", "offers"
  add_foreign_key "users_to_offers", "users"
end
