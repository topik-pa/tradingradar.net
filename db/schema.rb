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

ActiveRecord::Schema.define(version: 20171119111454) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "analyses", force: :cascade do |t|
    t.string   "isin"
    t.decimal  "borsa_italiana_support",    precision: 10, scale: 4
    t.decimal  "borsa_italiana_resistance", precision: 10, scale: 4
    t.string   "borsa_italiana_fta"
    t.decimal  "xxivore_support",           precision: 10, scale: 4
    t.decimal  "xxivore_resistance",        precision: 10, scale: 4
    t.string   "xxivore_shorttrend"
    t.decimal  "xxivore_ftaindex"
    t.decimal  "xxivore_rsi"
    t.string   "xxivore_rsidiv"
    t.decimal  "repubblica_support",        precision: 10, scale: 4
    t.decimal  "repubblica_resistance",     precision: 10, scale: 4
    t.boolean  "investing_dotcomrating"
    t.integer  "stock_id"
    t.datetime "created_at",                                         null: false
    t.datetime "updated_at",                                         null: false
    t.decimal  "milano_finanza_risk"
    t.string   "milano_finanza_rating"
    t.index ["stock_id"], name: "index_analyses_on_stock_id", using: :btree
  end

  create_table "ckeditor_assets", force: :cascade do |t|
    t.string   "data_file_name",               null: false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.string   "type",              limit: 30
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.index ["type"], name: "index_ckeditor_assets_on_type", using: :btree
  end

  create_table "markets", force: :cascade do |t|
    t.string   "name"
    t.decimal  "value"
    t.decimal  "variation"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "posts", force: :cascade do |t|
    t.string   "title"
    t.text     "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "stock"
  end

  create_table "stocks", force: :cascade do |t|
    t.string   "isin"
    t.string   "cod"
    t.string   "name"
    t.string   "sector"
    t.decimal  "last_price"
    t.string   "variation"
    t.string   "market_phase"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "studies", force: :cascade do |t|
    t.decimal  "resistance"
    t.decimal  "support"
    t.string   "direction"
    t.decimal  "mmp1"
    t.decimal  "mmp2"
    t.string   "gap"
    t.string   "trading_position"
    t.string   "reversal_chart_pattern"
    t.string   "continuation_chart_pattern"
    t.string   "reversal_candlestick"
    t.string   "continuation_candlestick"
    t.string   "rsi"
    t.string   "rsi_cross"
    t.string   "rsi_divergence"
    t.string   "stoch"
    t.string   "stoch_cross"
    t.string   "stoch_divergence"
    t.string   "macd"
    t.string   "macd_cross"
    t.decimal  "buy"
    t.decimal  "sell"
    t.decimal  "stop_loss"
    t.string   "image_usrl"
    t.text     "note"
    t.integer  "stock_id"
    t.integer  "user_id"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.index ["stock_id"], name: "index_studies_on_stock_id", using: :btree
    t.index ["user_id"], name: "index_studies_on_user_id", using: :btree
  end

  create_table "urls", force: :cascade do |t|
    t.string   "isin"
    t.string   "url1"
    t.string   "url2"
    t.string   "url3"
    t.string   "url4"
    t.string   "url5"
    t.string   "url6"
    t.string   "url7"
    t.string   "url8"
    t.string   "url9"
    t.string   "url10"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_foreign_key "analyses", "stocks"
  add_foreign_key "studies", "stocks"
  add_foreign_key "studies", "users"
end
