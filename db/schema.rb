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

ActiveRecord::Schema[7.1].define(version: 2023_11_16_071601) do
  create_table "entities", force: :cascade do |t|
    t.string "type"
    t.string "email"
    t.string "password"
    t.string "team_name"
    t.string "symbol"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["type"], name: "index_entities_on_type"
  end

  create_table "stocks", force: :cascade do |t|
    t.string "symbol"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "entity_id"
    t.index ["entity_id"], name: "index_stocks_on_entity_id"
  end

  create_table "teams", force: :cascade do |t|
    t.string "team_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "entity_id"
    t.index ["entity_id"], name: "index_teams_on_entity_id"
  end

  create_table "transactions", force: :cascade do |t|
    t.string "type"
    t.decimal "amount", precision: 10, scale: 2
    t.integer "source_wallet_id"
    t.integer "target_wallet_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["source_wallet_id"], name: "index_transactions_on_source_wallet_id"
    t.index ["target_wallet_id"], name: "index_transactions_on_target_wallet_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "entity_id"
    t.index ["entity_id"], name: "index_users_on_entity_id"
  end

  create_table "wallets", force: :cascade do |t|
    t.decimal "balance", default: "0.0"
    t.string "owner_type"
    t.integer "owner_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["owner_type", "owner_id"], name: "index_wallets_on_owner"
  end

  add_foreign_key "stocks", "entities"
  add_foreign_key "teams", "entities"
  add_foreign_key "transactions", "wallets", column: "source_wallet_id"
  add_foreign_key "transactions", "wallets", column: "target_wallet_id"
  add_foreign_key "users", "entities"
end
