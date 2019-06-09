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

ActiveRecord::Schema.define(version: 2019_06_05_082305) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string "type"
    t.string "street_name"
    t.bigint "country_id"
    t.bigint "state_id"
    t.bigint "city_id"
    t.date "from_date"
    t.date "to_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "lattitude"
    t.decimal "longitude"
    t.index ["city_id"], name: "index_addresses_on_city_id"
    t.index ["country_id"], name: "index_addresses_on_country_id"
    t.index ["state_id"], name: "index_addresses_on_state_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.integer "parent"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "category_products", force: :cascade do |t|
    t.bigint "product_id"
    t.bigint "category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_category_products_on_category_id"
    t.index ["product_id"], name: "index_category_products_on_product_id"
  end

  create_table "cities", force: :cascade do |t|
    t.string "name"
    t.bigint "state_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["state_id"], name: "index_cities_on_state_id"
  end

  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.string "company_type"
    t.bigint "sector_id"
    t.string "rc_no"
    t.bigint "user_id"
    t.string "office_email"
    t.string "office_phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sector_id"], name: "index_companies_on_sector_id"
    t.index ["user_id"], name: "index_companies_on_user_id"
  end

  create_table "countries", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "customers", force: :cascade do |t|
    t.bigint "individual_id"
    t.string "name"
    t.string "customer_code"
    t.string "class"
    t.decimal "wallet_bal"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["individual_id"], name: "index_customers_on_individual_id"
  end

  create_table "individuals", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "middle_name"
    t.string "title"
    t.string "gender"
    t.date "birth_date"
    t.string "about"
    t.string "picture"
    t.bigint "occupation_id"
    t.bigint "user_id"
    t.bigint "country_id"
    t.bigint "state_id"
    t.string "tagline"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["country_id"], name: "index_individuals_on_country_id"
    t.index ["occupation_id"], name: "index_individuals_on_occupation_id"
    t.index ["state_id"], name: "index_individuals_on_state_id"
    t.index ["user_id"], name: "index_individuals_on_user_id"
  end

  create_table "manufacturers", force: :cascade do |t|
    t.string "name"
    t.string "logo"
    t.string "tagline"
    t.string "code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "occupations", force: :cascade do |t|
    t.string "name"
    t.bigint "sector_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sector_id"], name: "index_occupations_on_sector_id"
  end

  create_table "permissions", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "product_images", force: :cascade do |t|
    t.bigint "product_id"
    t.string "image_base64"
    t.string "image_url"
    t.string "html_content"
    t.string "sort_order"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_product_images_on_product_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.string "short_decription"
    t.string "long_description"
    t.decimal "price"
    t.bigint "manufacturer_id"
    t.bigint "tax_class_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["manufacturer_id"], name: "index_products_on_manufacturer_id"
    t.index ["tax_class_id"], name: "index_products_on_tax_class_id"
  end

  create_table "role_permissions", force: :cascade do |t|
    t.bigint "role_id"
    t.bigint "permission_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["permission_id"], name: "index_role_permissions_on_permission_id"
    t.index ["role_id"], name: "index_role_permissions_on_role_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sectors", force: :cascade do |t|
    t.string "name"
    t.integer "parent"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "states", force: :cascade do |t|
    t.string "name"
    t.bigint "country_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["country_id"], name: "index_states_on_country_id"
  end

  create_table "suppliers", force: :cascade do |t|
    t.string "name"
    t.bigint "user_id"
    t.string "supplier_code"
    t.string "supplier_type"
    t.text "about"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_suppliers_on_user_id"
  end

  create_table "tax_classes", force: :cascade do |t|
    t.string "title"
    t.string "decription"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tax_rates", force: :cascade do |t|
    t.string "rate_code"
    t.integer "priority"
    t.bigint "tax_class_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tax_class_id"], name: "index_tax_rates_on_tax_class_id"
  end

  create_table "user_addresses", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "address_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["address_id"], name: "index_user_addresses_on_address_id"
    t.index ["user_id"], name: "index_user_addresses_on_user_id"
  end

  create_table "user_roles", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "role_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["role_id"], name: "index_user_roles_on_role_id"
    t.index ["user_id"], name: "index_user_roles_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "phone_no"
    t.string "username"
    t.boolean "status"
    t.string "password"
    t.string "default_password"
    t.boolean "email_confirmed"
    t.boolean "phoneno_confirmed"
    t.integer "parent"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email"
  end

  add_foreign_key "addresses", "cities"
  add_foreign_key "addresses", "countries"
  add_foreign_key "addresses", "states"
  add_foreign_key "category_products", "categories"
  add_foreign_key "category_products", "products"
  add_foreign_key "cities", "states"
  add_foreign_key "companies", "sectors"
  add_foreign_key "companies", "users"
  add_foreign_key "customers", "individuals"
  add_foreign_key "individuals", "countries"
  add_foreign_key "individuals", "occupations"
  add_foreign_key "individuals", "states"
  add_foreign_key "individuals", "users"
  add_foreign_key "occupations", "sectors"
  add_foreign_key "product_images", "products"
  add_foreign_key "products", "manufacturers"
  add_foreign_key "products", "tax_classes"
  add_foreign_key "role_permissions", "permissions"
  add_foreign_key "role_permissions", "roles"
  add_foreign_key "states", "countries"
  add_foreign_key "suppliers", "users"
  add_foreign_key "tax_rates", "tax_classes"
  add_foreign_key "user_addresses", "addresses"
  add_foreign_key "user_addresses", "users"
  add_foreign_key "user_roles", "roles"
  add_foreign_key "user_roles", "users"
end
