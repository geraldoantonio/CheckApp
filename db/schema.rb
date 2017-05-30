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

ActiveRecord::Schema.define(version: 20170509195014) do

  create_table "accounts", force: :cascade do |t|
    t.string   "number"
    t.integer  "bank_id"
    t.integer  "holder_id"
    t.string   "agency_code"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["bank_id"], name: "index_accounts_on_bank_id"
    t.index ["holder_id"], name: "index_accounts_on_holder_id"
  end

  create_table "banks", force: :cascade do |t|
    t.string   "bank_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "beneficiaries", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "address"
    t.string   "phone_1"
    t.string   "phone_2"
    t.integer  "holder_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["holder_id"], name: "index_beneficiaries_on_holder_id"
  end

  create_table "checks", force: :cascade do |t|
    t.string   "number"
    t.integer  "account_id"
    t.integer  "beneficiary_id"
    t.date     "date_discount"
    t.integer  "status",         default: 0
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.integer  "amount_cents",   default: 0
    t.index ["account_id"], name: "index_checks_on_account_id"
    t.index ["beneficiary_id"], name: "index_checks_on_beneficiary_id"
  end

  create_table "holders", force: :cascade do |t|
    t.string   "name"
    t.string   "cpf"
    t.string   "cnpj"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_holders_on_user_id"
  end

  create_table "user_preferences", force: :cascade do |t|
    t.integer "user_id"
    t.string  "email_type"
    t.string  "address"
    t.string  "port"
    t.string  "domain"
    t.string  "user_name"
    t.string  "password"
    t.string  "authentication"
    t.string  "enable_starttls_auto"
    t.index ["user_id"], name: "index_user_preferences_on_user_id"
  end

  create_table "users", force: :cascade do |t|
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
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
