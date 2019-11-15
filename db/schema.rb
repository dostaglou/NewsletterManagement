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

ActiveRecord::Schema.define(version: 2019_11_15_073853) do

  create_table "email_sents", force: :cascade do |t|
    t.string "targets"
    t.integer "template_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "status"
    t.index ["template_id"], name: "index_email_sents_on_template_id"
  end

  create_table "managers", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "newsletters_count"
  end

  create_table "newsletters", force: :cascade do |t|
    t.integer "manager_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "subscribers_count"
    t.integer "templates_count"
    t.index ["manager_id"], name: "index_newsletters_on_manager_id"
  end

  create_table "subscribers", force: :cascade do |t|
    t.string "fullname"
    t.string "email"
    t.integer "newsletter_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "unsub_code"
    t.string "status"
    t.index ["newsletter_id"], name: "index_subscribers_on_newsletter_id"
  end

  create_table "templates", force: :cascade do |t|
    t.string "name"
    t.integer "newsletter_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "content"
    t.string "header"
    t.string "status"
    t.index ["newsletter_id"], name: "index_templates_on_newsletter_id"
  end

end
