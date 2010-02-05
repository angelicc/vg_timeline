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

ActiveRecord::Schema.define(:version => 20100205100434) do

  create_table "achievements", :force => true do |t|
    t.string   "name",       :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "developers", :force => true do |t|
    t.string   "name",           :null => false
    t.string   "country"
    t.date     "founded"
    t.integer  "former_name_id"
    t.integer  "publisher_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "features", :force => true do |t|
    t.string   "description", :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "formats", :force => true do |t|
    t.string   "name",       :null => false
    t.string   "capacity"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "game_types", :force => true do |t|
    t.string   "name",       :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "games", :force => true do |t|
    t.string   "main_title",                                    :null => false
    t.string   "sub_title"
    t.string   "special_title"
    t.text     "description"
    t.integer  "series_id"
    t.boolean  "spinoff",                    :default => false, :null => false
    t.date     "release_date"
    t.integer  "game_market_id"
    t.integer  "rating_id"
    t.integer  "game_press_id"
    t.integer  "platform_id",                                   :null => false
    t.integer  "game_platform_id"
    t.string   "boxart"
    t.float    "game_sales"
    t.integer  "game_award_id"
    t.integer  "sequel_id"
    t.integer  "prequel_id"
    t.integer  "local_players"
    t.integer  "online_players"
    t.integer  "local_multi_modes_id"
    t.integer  "online_multi_modes_id"
    t.boolean  "release_special_edition"
    t.integer  "re_release_id"
    t.integer  "remake_id"
    t.integer  "game_type_id",                                  :null => false
    t.integer  "game_include_peripheral_id"
    t.integer  "game_project_leader_id"
    t.integer  "game_composer_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "games_achievements", :force => true do |t|
    t.integer  "game_id",         :null => false
    t.integer  "achievements_id", :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "games_awards", :force => true do |t|
    t.integer  "game_id",     :null => false
    t.integer  "press_id",    :null => false
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "games_composers", :force => true do |t|
    t.integer  "game_id",            :null => false
    t.integer  "industry_person_id", :null => false
    t.string   "position"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "games_developers", :force => true do |t|
    t.integer  "game_id",      :null => false
    t.integer  "developer_id", :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "games_different_markets", :force => true do |t|
    t.integer  "game_id",             :null => false
    t.integer  "diff_market_game_id", :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "games_features", :force => true do |t|
    t.integer  "game_id",    :null => false
    t.integer  "feature_id", :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "games_genres", :force => true do |t|
    t.integer  "game_id",    :null => false
    t.integer  "genre_id",   :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "games_include_peripherals", :force => true do |t|
    t.integer  "game_id",                      :null => false
    t.integer  "peripheral_id",                :null => false
    t.integer  "quantity",      :default => 1
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "games_markets", :force => true do |t|
    t.integer  "game_id",      :null => false
    t.integer  "market_id",    :null => false
    t.float    "market_sales"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "games_peripherals", :force => true do |t|
    t.integer  "game_id",       :null => false
    t.integer  "peripheral_id", :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "games_platforms", :force => true do |t|
    t.integer  "game_id",        :null => false
    t.integer  "platform_id",    :null => false
    t.float    "platform_sales"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "games_press", :force => true do |t|
    t.integer  "game_id",     :null => false
    t.integer  "press_id",    :null => false
    t.string   "score",       :null => false
    t.string   "review_link"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "games_project_leaders", :force => true do |t|
    t.integer  "game_id",            :null => false
    t.integer  "industry_person_id", :null => false
    t.string   "position"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "games_publishers", :force => true do |t|
    t.integer  "game_id",      :null => false
    t.integer  "publisher_id", :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "games_reboxings", :force => true do |t|
    t.integer  "game_id",      :null => false
    t.string   "boxart"
    t.date     "release_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "games_specifications", :force => true do |t|
    t.integer  "game_id",          :null => false
    t.integer  "specification_id", :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "genres", :force => true do |t|
    t.string   "name",       :null => false
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
    t.string   "name",           :limit => 100,                    :null => false
    t.integer  "new_games",                                        :null => false
    t.integer  "modifications",                                    :null => false
    t.boolean  "delete_games",                  :default => false, :null => false
    t.boolean  "add_categories",                :default => false, :null => false
    t.boolean  "manage_users",                  :default => false, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "markets", :force => true do |t|
    t.string   "name",         :null => false
    t.string   "abbreviation", :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "modifications", :force => true do |t|
    t.integer  "user_id",                        :null => false
    t.string   "description",                    :null => false
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
    t.integer  "platform_id", :null => false
    t.string   "name"
    t.text     "description"
    t.string   "storage"
    t.string   "logo"
    t.string   "picture"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "platforms", :force => true do |t|
    t.string   "name",                                   :null => false
    t.integer  "publisher_id",                           :null => false
    t.text     "description"
    t.integer  "generation"
    t.integer  "controller_ports"
    t.boolean  "online_connectivity", :default => false, :null => false
    t.integer  "precursor_id"
    t.integer  "platform_market_id"
    t.float    "overall_sales"
    t.string   "logo"
    t.string   "picture"
    t.integer  "addon_id"
    t.string   "storage"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "platforms_formats", :force => true do |t|
    t.integer  "platform_id", :null => false
    t.integer  "format_id",   :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "platforms_markets", :force => true do |t|
    t.integer  "platform_id",  :null => false
    t.integer  "market_id",    :null => false
    t.float    "market_sales"
    t.date     "release_date", :null => false
    t.date     "final_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "press", :force => true do |t|
    t.string   "name",       :null => false
    t.string   "url"
    t.string   "region"
    t.integer  "market_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "publishers", :force => true do |t|
    t.string   "name",           :null => false
    t.string   "country"
    t.date     "founded"
    t.integer  "former_name_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ratings", :force => true do |t|
    t.string   "name",        :null => false
    t.string   "description"
    t.integer  "market_id",   :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "series", :force => true do |t|
    t.string   "name",               :null => false
    t.integer  "spinoff_series_id"
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
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "name",            :null => false
    t.string   "email",           :null => false
    t.string   "hashed_password", :null => false
    t.integer  "level_id",        :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
