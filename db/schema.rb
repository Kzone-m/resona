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

ActiveRecord::Schema.define(version: 20170724175830) do

  create_table "brands", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "carts", force: :cascade do |t|
    t.integer "user_id"
    t.integer "sell_item_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sell_item_id"], name: "index_carts_on_sell_item_id"
    t.index ["user_id", "sell_item_id"], name: "cart_multi_index", unique: true
    t.index ["user_id", "sell_item_id"], name: "index_carts_on_user_id_and_sell_item_id"
    t.index ["user_id"], name: "index_carts_on_user_id"
  end

  create_table "categories", force: :cascade do |t|
    t.integer "instrument_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["instrument_id"], name: "index_categories_on_instrument_id"
  end

  create_table "conditions", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "images", force: :cascade do |t|
    t.integer "sell_item_id"
    t.string "picture"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sell_item_id"], name: "index_images_on_sell_item_id"
  end

  create_table "instruments", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "product_models", force: :cascade do |t|
    t.integer "instrument_id"
    t.integer "brand_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["brand_id"], name: "index_product_models_on_brand_id"
    t.index ["instrument_id"], name: "index_product_models_on_instrument_id"
  end

  create_table "sell_items", force: :cascade do |t|
    t.integer "user_id"
    t.integer "instrument_id"
    t.integer "brand_id"
    t.integer "condition_id"
    t.string "name"
    t.string "listing_title"
    t.integer "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "product_model_id"
    t.integer "category_id"
    t.index ["brand_id"], name: "index_sell_items_on_brand_id"
    t.index ["category_id"], name: "index_sell_items_on_category_id"
    t.index ["condition_id"], name: "index_sell_items_on_condition_id"
    t.index ["instrument_id"], name: "index_sell_items_on_instrument_id"
    t.index ["product_model_id"], name: "index_sell_items_on_product_model_id"
    t.index ["user_id"], name: "index_sell_items_on_user_id"
  end

  create_table "shops", force: :cascade do |t|
    t.integer "user_id"
    t.string "name"
    t.text "description"
    t.string "logo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_shops_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
