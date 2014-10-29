# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20141029120734) do

  create_table "addresses", force: true do |t|
    t.string  "pao"
    t.string  "sao"
    t.integer "street_id"
    t.integer "town_id"
    t.integer "locality_id"
    t.integer "postcode_id"
  end

  create_table "localities", force: true do |t|
    t.string  "name"
    t.integer "town_id"
    t.integer "postcode_id"
    t.integer "street_id"
    t.integer "address_id"
  end

  create_table "postcodes", force: true do |t|
    t.string  "name"
    t.integer "locality_id"
    t.integer "town_id"
    t.integer "address_id"
    t.integer "street_id"
  end

  create_table "streets", force: true do |t|
    t.string  "name"
    t.integer "locality_id"
    t.integer "town_id"
    t.integer "address_id"
    t.integer "postcode_id"
  end

  create_table "towns", force: true do |t|
    t.string  "name"
    t.integer "address_id"
    t.integer "postcode_id"
    t.integer "street_id"
  end

end
