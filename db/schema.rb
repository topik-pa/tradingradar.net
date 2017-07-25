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

ActiveRecord::Schema.define(version: 20170725191904) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "analyses", force: :cascade do |t|
    t.string   "isin"
    t.decimal  "borsaItalianaSupport"
    t.decimal  "borsaItalianaResistance"
    t.string   "borsaItalianaFTA"
    t.decimal  "xxivOreSupport"
    t.decimal  "xxivOreResistance"
    t.string   "xxivOreShortTrend"
    t.string   "xxivOreFTAIndex"
    t.string   "xxivOreRSI"
    t.string   "xxivOreRSIDiv"
    t.decimal  "repubblicaSupport"
    t.decimal  "repubblicaResistance"
    t.boolean  "investingDotComRating"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "markets", force: :cascade do |t|
    t.string   "name"
    t.decimal  "value"
    t.decimal  "variation"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "stocks", force: :cascade do |t|
    t.string   "isin"
    t.string   "cod"
    t.string   "name"
    t.string   "sector"
    t.decimal  "lastPrice"
    t.string   "variation"
    t.string   "marketPhase"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "studies", force: :cascade do |t|
    t.decimal  "resistance"
    t.decimal  "support"
    t.string   "direction"
    t.decimal  "mmp1"
    t.decimal  "mmp2"
    t.string   "gap"
    t.string   "tradingPosition"
    t.string   "reversalChartPattern"
    t.string   "continuationChartPattern"
    t.string   "reversalCandlestick"
    t.string   "continuationCandlestick"
    t.string   "rsi"
    t.string   "rsiCross"
    t.string   "rsiDivergence"
    t.string   "stoch"
    t.string   "stochCross"
    t.string   "stochDivergence"
    t.string   "macd"
    t.string   "macdCross"
    t.decimal  "buy"
    t.decimal  "sell"
    t.decimal  "stopLoss"
    t.string   "imageUrl"
    t.text     "note"
    t.integer  "stock_id"
    t.integer  "user_id"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
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

  add_foreign_key "studies", "stocks"
  add_foreign_key "studies", "users"
end
