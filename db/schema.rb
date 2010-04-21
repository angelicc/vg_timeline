# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20100418012924) do

  create_table "achievements", :force => true do |t|
    t.string   "name",       :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "achievements_games", :id => false, :force => true do |t|
    t.integer "achievement_id"
    t.integer "game_id"
  end

  create_table "awards", :force => true do |t|
    t.integer  "game_id",     :null => false
    t.integer  "press_id",    :null => false
    t.string   "description", :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "composers_games", :id => false, :force => true do |t|
    t.integer "industry_person_id"
    t.integer "game_id"
  end

  create_table "developers", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.date     "founded"
    t.integer  "former_name_id"
    t.integer  "publisher_id"
  end

  create_table "developers_games", :id => false, :force => true do |t|
    t.integer "developer_id"
    t.integer "game_id"
  end

  create_table "different_markets_games", :id => false, :force => true do |t|
    t.integer "different_market_id"
    t.integer "game_id"
  end

  create_table "different_platforms_games", :id => false, :force => true do |t|
    t.integer "different_platform_id"
    t.integer "game_id"
  end

  create_table "features", :force => true do |t|
    t.string   "description", :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "features_games", :id => false, :force => true do |t|
    t.integer "feature_id"
    t.integer "game_id"
  end

  create_table "formats", :force => true do |t|
    t.string   "name",       :null => false
    t.string   "capacity"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "formats_platforms", :id => false, :force => true do |t|
    t.integer "format_id"
    t.integer "platform_id"
  end

  create_table "games", :force => true do |t|
    t.string   "main_title",                                 :null => false
    t.string   "sub_title"
    t.date     "release_date",                               :null => false
    t.string   "boxart_file_name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "platform_id",                                :null => false
    t.integer  "hits",                    :default => 0,     :null => false
    t.string   "special_title"
    t.text     "description"
    t.integer  "series_id"
    t.boolean  "spinoff",                 :default => false, :null => false
    t.integer  "market_id"
    t.integer  "rating_id"
    t.float    "sales"
    t.integer  "sequel_id"
    t.integer  "prequel_id"
    t.integer  "local_players"
    t.integer  "online_players"
    t.integer  "local_multi_modes_id"
    t.integer  "online_multi_modes_id"
    t.boolean  "release_special_edition", :default => false, :null => false
    t.integer  "re_release_id"
    t.integer  "remake_id"
  end

  create_table "games_genres", :id => false, :force => true do |t|
    t.integer "game_id"
    t.integer "genre_id"
  end

  create_table "games_peripherals", :id => false, :force => true do |t|
    t.integer "game_id"
    t.integer "peripheral_id"
  end

  create_table "games_publishers", :id => false, :force => true do |t|
    t.integer "game_id"
    t.integer "publisher_id"
  end

  create_table "games_specifications", :id => false, :force => true do |t|
    t.integer "game_id"
    t.integer "specification_id"
  end

  create_table "games_types", :id => false, :force => true do |t|
    t.integer "game_id"
    t.integer "type_id"
  end

  create_table "genres", :force => true do |t|
    t.string   "name",       :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "include_peripherals", :force => true do |t|
    t.integer  "game_id",                      :null => false
    t.integer  "peripheral_id",                :null => false
    t.integer  "quantity",      :default => 1, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "industry_people", :force => true do |t|
    t.string   "name",         :null => false
    t.integer  "publisher_id"
    t.string   "nationality"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "levels", :force => true do |t|
    t.integer  "level",                             :null => false
    t.integer  "exp_next_level"
    t.string   "name",                              :null => false
    t.integer  "new_games",                         :null => false
    t.integer  "modifications",                     :null => false
    t.boolean  "delete_games",   :default => false, :null => false
    t.boolean  "add_categories", :default => false, :null => false
    t.boolean  "manage_users",   :default => false, :null => false
    t.boolean  "admin",          :default => false, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "levels", ["level"], :name => "level", :unique => true

  create_table "markets", :force => true do |t|
    t.string   "name",         :null => false
    t.string   "abbreviation", :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "modifications", :force => true do |t|
    t.integer  "user_id",                        :null => false
    t.string   "description"
    t.boolean  "remove",      :default => false, :null => false
    t.boolean  "new",         :default => false, :null => false
    t.boolean  "modified",    :default => false, :null => false
    t.integer  "table_id",                       :null => false
    t.integer  "modified_id",                    :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "multiplayer_modes", :force => true do |t|
    t.boolean  "coop",       :default => false, :null => false
    t.boolean  "vs",         :default => false, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "peripherals", :force => true do |t|
    t.string   "name",        :null => false
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "platform_versions", :force => true do |t|
    t.integer  "platform_id",      :null => false
    t.string   "name",             :null => false
    t.text     "description"
    t.string   "storage"
    t.string   "logo_filename"
    t.string   "picture_filename"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "platforms", :force => true do |t|
    t.string   "name",                                   :null => false
    t.string   "logo"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "short_name",                             :null => false
    t.integer  "publisher_id"
    t.text     "description"
    t.integer  "generation"
    t.integer  "controller_ports"
    t.boolean  "online_connectivity", :default => false, :null => false
    t.integer  "precursor_id"
    t.integer  "market_id"
    t.float    "sales"
    t.string   "logo_filename"
    t.string   "picture_filename"
    t.integer  "addon_id"
    t.string   "storage"
  end

  create_table "press", :force => true do |t|
    t.string   "name",       :null => false
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "region"
    t.integer  "market_id"
  end

  create_table "project_leaders", :force => true do |t|
    t.integer  "game_id",            :null => false
    t.integer  "industry_person_id", :null => false
    t.string   "position"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "publishers", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.date     "founded"
    t.integer  "former_name_id"
  end

  create_table "rating_systems", :force => true do |t|
    t.string   "name",       :null => false
    t.integer  "market_id",  :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ratings", :force => true do |t|
    t.string   "name",                           :null => false
    t.integer  "rating_system_id",               :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "abbreviation",     :limit => 10
    t.string   "logo_filename"
  end

  create_table "reboxings", :force => true do |t|
    t.integer  "game_id",         :null => false
    t.string   "boxart_filename"
    t.date     "release_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "scores", :force => true do |t|
    t.string   "score"
    t.string   "url"
    t.integer  "press_id",   :null => false
    t.integer  "game_id",    :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "series", :force => true do |t|
    t.string   "name",               :null => false
    t.integer  "main_series_id"
    t.integer  "industry_person_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "specifications", :force => true do |t|
    t.string   "description", :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tables", :force => true do |t|
    t.string   "name",       :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "types", :force => true do |t|
    t.string   "name",       :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                               :default => "", :null => false
    t.string   "encrypted_password",   :limit => 128, :default => "", :null => false
    t.string   "password_salt",                       :default => "", :null => false
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "reset_password_token"
    t.string   "remember_token"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                       :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "username",                                            :null => false
    t.integer  "level_id",                            :default => 1,  :null => false
    t.integer  "exp",                                 :default => 0,  :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["confirmation_token"], :name => "index_users_on_confirmation_token", :unique => true
  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true
  add_index "users", ["username"], :name => "Index_users_on_username", :unique => true

end
