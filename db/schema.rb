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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110102155521) do

  create_table "assets", :force => true do |t|
    t.integer  "prompt_id"
    t.string   "attachment"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "assets", ["prompt_id", "attachment"], :name => "index_assets_on_prompt_id_and_attachment"
  add_index "assets", ["prompt_id"], :name => "index_assets_on_prompt_id"

  create_table "prompts", :force => true do |t|
    t.string   "title"
    t.boolean  "displayit"
    t.integer  "asset_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "prompts", ["asset_id"], :name => "index_prompts_on_asset_id"
  add_index "prompts", ["displayit"], :name => "index_prompts_on_displayit"
  add_index "prompts", ["title"], :name => "index_prompts_on_title"

  create_table "users", :force => true do |t|
    t.string   "firstname"
    t.string   "lastname"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], :name => "index_users_on_email"

end
