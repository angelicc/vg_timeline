class GamesController < ApplicationController
  #caches_page :index

  Limit = 0

  def index
    if params[:search]
      @games = Game.where("LOWER(main_title) LIKE ?", "%#{params[:search].downcase}%")
      respond_to do |format|
        format.js
      end
    else
      @title = "Year View"
      @game = Game.new
      @year = params[:year] ? params[:year].to_i : Date.today.year;
      @id = params[:game_id] if params[:game_id]
      @enter_year = true
      @games = Game.where('release_date >= ? and release_date <= ?', "#{@year}-01-01", "#{@year}-12-31").order("release_date asc, hits desc, main_title asc").all
      @platforms = Platform.order("name asc")
      @publishers = Publisher.order("name asc")
      @developers = Developer.order("name asc")
      if not @games.empty?
        games = make_games_array(@games, Limit, true)
        @months = games['games']
        @platforms_month = games['platforms']
        @platforms_year = games['platforms_year']
      end
    end
  end

  def other_year
    @game = Game.new
    @year = params[:year] ? params[:year].to_i : Date.today.year;
    @id = params[:game_id] if params[:game_id]
    @enter_year = true
    @games = Game.where('release_date >= ? and release_date <= ?', "#{@year}-01-01", "#{@year}-12-31").order("release_date asc, hits desc, main_title asc").all
    if not @games.empty?
      flash.discard(:notice)
      games = make_games_array(@games, Limit, true)
      @months = games['games']
      @platforms_month = games['platforms']
      @platforms_year = games['platforms_year']
    end
    respond_to do |format|
      format.js
    end
  end

  def list
    @level = params[:lv]
    @view = params[:action]
    @games = Game.order("main_title asc")
    respond_to do |format|
      format.js { render 'pop_up' }
    end
  end

  def recent
    @level = params[:lv]
    @view = params[:action]
    @games = Game.order("created_at desc").limit(20)
    respond_to do |format|
      format.js { render 'pop_up' }
    end
  end

  def order_games_list
    @games = Game.order("#{params[:order]} asc")
    if params[:order] == "platform_id"
      @games = @games.sort { |a, b| a.platform.name <=> b.platform.name }
    end
    respond_to do |format|
      format.js
    end
  end

  def show
    @game = Game.find(params[:id])
    @title = @game.full_title_limit
  end

  def new
    @level = params[:lv] + "&"
    index = @level.index("month")
    @month = @level.slice(@level.index("=", index) + 1, @level.index("&", index) - @level.index("=", index) - 1) if index
    index = @level.index("year")
    @year = @level.slice(@level.index("=", index) + 1, @level.index("&", index) - @level.index("=", index) - 1) if index
    index = @level.index("id_diff")
    id_diff = @level.slice(@level.index("=", index) + 1, @level.index("&", index) - @level.index("=", index) - 1) if index
    @level = @level.slice(0,1) if @level.length > 1
    @view = params[:action]
    @title = "Add New Game"
    if id_diff
      game_diff = Game.find(id_diff)
      attributes = { :main_title => game_diff.main_title, :sub_title => game_diff.sub_title, :release_date => game_diff.release_date }
      @view = "new_lite"
      @diff_platform_id = game_diff.id
    end
    @game = attributes ? Game.new(attributes) : Game.new
    @game.publisher_names = game_diff.publisher_names if game_diff
    @date = (@year && @month) ? Date.parse("#{@year}-#{@month}-01") : Date.today
    @platforms = Platform.all
    @markets = Market.all
    rating_system = RatingSystem.where("market_id = ?", @markets.first.id).first
    @ratings = Rating.where("rating_system_id = ?", rating_system.id).order("name asc")
    @developers = Developer.order("name asc").all
    @publishers = Publisher.order("name asc").all
    respond_to do |format|
      format.js { render 'pop_up' }
    end
  end

  def new_game_add_developer
    @developers = Developer.order("name asc").all
    respond_to do |format|
      format.js
    end
  end

  def new_game_add_publisher
    @publishers = Publisher.order("name asc").all
    respond_to do |format|
      format.js
    end
  end

  def create
    platform = Platform.find_by_name(params[:game][:platform_name])
    @game_exists = Game.where("main_title = ? and sub_title = ? and platform_id = ?", params[:game][:main_title], params[:game][:sub_title], platform.id).first if platform
    @game_diff = Game.find(params[:diff_platform_id]) if params[:diff_platform_id]
    if @game_exists and @game_diff
      for game in @game_exists.different_platforms
        game.different_platforms << @game_diff unless game.different_platforms.exists?(@game_diff) or game == @game_diff
        @game_diff.different_platforms << game unless @game_diff.different_platforms.exists?(game) or @game_diff == game
      end
      for game2 in @game_diff.different_platforms
        game2.different_platforms << @game_exists unless game2.different_platforms.exists?(@game_exists) or game2 == @game_exists
        @game_exists.different_platforms << game2 unless @game_exists.different_platforms.exists?(game2) or @game_exists == game2
        for game3 in @game_exists.different_platforms
          game2.different_platforms << game3 unless game2.different_platforms.exists?(game3) or game2 == game3
          game3.different_platforms << game2 unless game3.different_platforms.exists?(game2) or game3 == game2
        end
      end
      @game_exists.different_platforms << @game_diff unless @game_exists.different_platforms.exists?(@game_diff) or @game_exists == @game_diff
      @game_diff.different_platforms << @game_exists unless @game_diff.different_platforms.exists?(@game_exists) or @game_diff == @game_exists
      flash[:notice] = "Games linked succesfully."
      redirect_to game_path(@game_exists)
    elsif @game_exists and not @game_diff
      flash[:alert] = "Game already exists."
      redirect_to game_path(@game_exists)
    else
      @game = Game.new(params[:game])
      if @game_diff
        @game.market = @game_diff.market
        @game.description = @game_diff.description
        @game.series = @game_diff.series
        @game.spinoff = @game_diff.spinoff
        @game.rating = @game_diff.rating
        @game.local_players = @game_diff.local_players
        @game.online_players = @game_diff.online_players
        @game.local_multi_modes = @game_diff.local_multi_modes
        @game.online_multi_modes = @game_diff.online_multi_modes
        @game.developers = @game_diff.developers
        @game.features = @game_diff.features
        @game.genres = @game_diff.genres
        @game.publishers = @game_diff.publishers
        @game.specifications = @game_diff.specifications
        @game.types = @game_diff.types
        @game.project_leaders = @game_diff.project_leaders
        @game.different_platforms << @game_diff
        for game1 in @game_diff.different_platforms
          @game.different_platforms << game1 unless @game.different_platforms.exists?(game1) or game1 == @game
        end
      end
      @developers = []; @publishers = []
      if @game.save
        create_log_entry('games', @game.id, "Added game #{@game.full_title_limit}.", :new => true)
        if @game_diff
          @game_diff.different_platforms << @game
          for game4 in @game_diff.different_platforms
            game4.different_platforms << @game unless (game4.different_platforms.exists?(@game) or game4 == @game)
          end
        end
        add_flash = experience_user(10)
        flash[:notice] = "Game succesfully created." + add_flash
        redirect_to game_path(@game)
      else
        @title = "Add New Game"
        @platforms = Platform.all
        @developers = Developer.order("name asc").all
        @publishers = Publisher.order("name asc").all
        render :partial => 'new', :layout => 'application'
      end
    end
  end

  def edit
    @level = params[:lv] + "&"
    index = @level.index("id")
    id = @level.slice(@level.index("=", index) + 1, @level.index("&", index) - @level.index("=", index) - 1) if index
    index = @level.index("view")
    view = @level.slice(@level.index("=", index) + 1, @level.index("&", index) - @level.index("=", index) - 1) if index
    @level = @level.slice(0,1) if @level.length > 1
    @view = view ? view : params[:action]
    @title = "Edit Game"
    @game = Game.find(id)
    @date = @game.release_date
    @markets = Market.all
    rating_system = RatingSystem.where("market_id = ?", @markets.first.id).first
    @ratings = Rating.where("rating_system_id = ?", rating_system.id).order("name asc")
    @platforms = Platform.all
    @developers = Developer.order("name asc").all
    @publishers = Publisher.order("name asc").all
    respond_to do |format|
      format.js { render 'pop_up' }
    end
  end

  def update
    @game = Game.find(params[:id])
    @old = @game
#    styles = %w(thumb mini medium original)
    if @game.update_attributes(params[:game])
      create_log_entry('games', @game.id, "Modified game #{@game.full_title_limit}.", :mod => true)
      for game in @game.different_platforms
        create_log_entry('games', @game.id, "Modified #{@game.full_title_limit}.", :mod => true)
        game.update_attribute('series_id', @game.series_id)
      end
#      for style in styles
#        FileUtils.mkdir "#{Rails.root}/public/images/#{@game.r_y}" unless File.exist?("#{Rails.root}/public/images/#{@game.r_y}")
#        FileUtils.mkdir "#{Rails.root}/public/images/#{@game.r_y}/#{@game.r_m}" unless File.exist?("#{Rails.root}/public/images/#{@game.r_y}/#{@game.r_m}")
#        FileUtils.mkdir "#{Rails.root}/public/images/#{@game.r_y}/#{@game.r_m}/#{style}" unless File.exist?("#{Rails.root}/public/images/#{@game.r_y}/#{@game.r_m}/#{style}")
#        FileUtils.mv "#{Rails.root}/public/images/#{@old.r_y}/#{@old.r_m}/#{style}/#{@old.make_boxart_path}", "#{Rails.root}/public/images/#{@game.r_y}/#{@game.r_m}/#{style}/#{@game.make_boxart_path}" if File.exist?("#{Rails.root}/public/images/#{@old.r_y}/#{@old.r_m}/#{style}/#{@old.make_boxart_path}")
#      end
      add_flash = experience_user(5)
      flash[:notice] = "Game succesfully updated." + add_flash
      redirect_to game_path(@game)
    else
      @title = "Add New Game"
      @platforms = Platform.all
      @developers = Developer.order("name asc").all
      @publishers = Publisher.order("name asc").all
      render :partial => 'edit', :layout => 'application'
    end
  end

  def show_game_info
    @game = Game.find(params[:id])
    x_coord = params[:xcoord]
    if x_coord.to_i > 0
      @right = true
    else
      @right = false
    end
    @game.update_attribute('hits', @game.hits += 1)
    @div_id = "game#{params[:id]}"
    @scores = @game.scores
    respond_to do |format|
      format.js
    end
  end

  def show_game_tooltip
    @game_info = Game.find(params[:id])
    @pos = params[:pos]
    respond_to do |format|
      format.js
    end
  end

  def update_year
    @year = params[:y]; @ignore_months = []
    params.each_pair { |key,value|
      if key[0,2] == "ig"
        @ignore_months << value
      end
    }
    @games = search_games_by_checked_platforms(params)
    if @games.empty?
      flash[:notice] = "No games"
    else
      games = make_games_array(@games, params[:l].to_i, true)
      @months = games['games']
      @no_games = games['no_games']
    end
    @limit = params[:l].to_i
    respond_to do |format|
      format.js
    end
  end

  def update_month
    @m = params[:m]; @year = params[:y]; @limit = params[:l].to_i
    @games = search_games_by_checked_platforms(params)
    if not @games.empty?
      games = make_games_array(@games, @limit)
      @month = games['games']
    end
    respond_to do |format|
      format.js
    end
  end

  def update_day
    sh = params[:sh].to_i
    @games = search_games_by_checked_platforms(params)
    if params[:type] == 'next'
      games = make_games_array(@games, sh + Limit - 1, false, sh, false)
    else
      games = make_games_array(@games, sh - 2, false, sh - Limit - 1, false)
    end
    @day = games['games']
    if params[:type] == 'next'
      @sh = sh + @day.length - 1
    else
      @sh = sh - 1
    end
    time = Time.parse(params[:date])
    @day_text = time.day
    if @day_text.to_s.length == 1
      @day_text = "0" + @day_text.to_s
    end
    respond_to do |format|
      format.js
    end
  end

  def change_year
    @year = params[:year].to_i
    @lshown = params[:to].to_i
    if @lshown > (2012)
      @lshown = 2012
    elsif @lshown < 1975
      @lshown = 1975
    end
    respond_to do |format|
      format.js
    end
  end

  def close_info_window
    @div_id = params[:id]
    respond_to do |format|
      format.js
    end
  end

  # TODO fix action

  def change_boxart
    @game = Game.find(params[:id])
    respond_to do |format|
      format.js
    end
  end
  def update_boxart
    @game = Game.find(params[:id])
    @game = update_attribute('boxart_dir' => params[:boxart_dir])
    respond_to do |format|
      format.js
    end
  end

  private
  # games => array, games to be formatted for the view(can be an array returned by search_games_by_checked_platforms)
  #
  # limit => int, highest number in array to show in one day (starts in 'start' ends in 'limit'), 0 for no limit[default => 0]
  #
  # include_months => bool, true to return array of months, days and games, false for days and games only[default => false]
  #
  # start => int, specify where to begin to show games on a certain day[default => 0]
  #
  # include_days => bool, true to return array of days and games, false for games in a single day[default => true]
  #
  # returns a Hash, 'games' is the array itself, 'platforms' is an array of platforms by month in every game of the array
  # 'platforms_year' is an array of all the platforms in games of a given year (only if include_months == true)
  # and 'no_games' is an array of month numbers of that year where there are no games (only if include_months == true)
  def make_games_array(games, limit = 0, include_months = false, start = 0, include_days = true)
    first = games.first
    if include_months
      months_year = [first.r_m]
      month = first.r_m
      months_with_no_games = ['01', '02', '03', '04', '05', '06', '07', '08', '09', '10', '11', '12']
      months_with_no_games.delete(month)
      platforms_year = []
    end
    if include_days
      gms = [0]
      next_month = false
      day_change = false
      days_month = [first.r_d]
      day = first.r_d
    else
      gms = [games.length]
    end
    g = 0
    platforms_months = [first.r_m]
    platforms = []
    for game in games
      next_month = month < game.r_m ? true : false if include_months
      if (next_month || day < game.r_d)
        g = 0
        days_month << gms
        gms = [0]
        day = game.r_d
        day_change = month < game.r_m ? true : false if include_months
        days_month << game.r_d unless day_change
      end if include_days
      if month < game.r_m
        months_year << days_month
        platforms_months << platforms
        days_month = []
        platforms = []
        month = game.r_m
        months_with_no_games.delete(month)
        days_month << game.r_d
        months_year << game.r_m
        platforms_months << game.r_m
      end if include_months
      if include_days
        gms << game #if (gms.length < limit + 1 or limit == 0)
      else
        gms << game #if g >= start and g <= limit
      end
      platforms << game.platform unless platforms.include?(game.platform)
      platforms_year << game.platform unless platforms_year.include?(game.platform) if include_months
      g += 1
      gms[0] = g if include_days
    end
    days_month << gms if include_days
    months_year << days_month if include_months
    platforms_months << platforms
    if include_months
      games_array = months_year
    elsif include_days
      games_array = days_month
    else
      games_array = gms
    end
    return { 'games' => games_array, 'platforms' => platforms_months, 'platforms_year' => platforms_year, 'no_games' => months_with_no_games }
  end

  # parameters => hash, parameters passed to the action(includes params ids as params values, year as y, month as m, date as date
  # limit as l, limit of month as li + (no of month), games showing as sh, month to ignore as ig)
  #
  # returns an array of games with the specified platform(s) and date(s), this can be passed on to make_games_array
  def search_games_by_checked_platforms(parameters = { :of => "0", :l => "0", :y => Date.today.year })
    unless parameters[:date]
      year = parameters[:y]
      if parameters[:m]
        starting_month = parameters[:m]
        ending_month = parameters[:m]
      else
        starting_month = "01"
        ending_month = "12"
      end
      starting_day = "01"
      ending_day = "31"
    end
    offset = parameters[:of]
    #    limit = parameters[:l]
    limit = "0"
    games = []
    platform_ids = []
    parameters.each_pair { |key, value|
      if key.to_i > 0 and value.to_i > 0
        platform_ids << value
      end
    }
    platform_query = ""
    unless platform_ids.empty?
      platform_ids = platform_ids.join(",")
      platform_query = " and platform_id in (#{platform_ids})"
    end
    if parameters[:date]
      if limit == "0"
        games = Game.where("release_date = ?#{platform_query}", parameters[:date]).order("release_date asc, hits desc, main_title asc").offset(offset)
      else
        games = Game.where("release_date = ?#{platform_query}", parameters[:date]).order("release_date asc, hits desc, main_title asc").offset(offset).limit(limit)
      end
    else
      if limit == "0"
        games = Game.where("release_date >= ? and release_date <= ?#{platform_query}", "#{year}-#{starting_month}-#{starting_day}", "#{year}-#{ending_month}-#{ending_day}").order("release_date asc, hits desc, main_title asc").offset(offset)
      else
        games = Game.where("release_date >= ? and release_date <= ?#{platform_query}", "#{year}-#{starting_month}-#{starting_day}", "#{year}-#{ending_month}-#{ending_day}").order("release_date asc, hits desc, main_title asc").offset(offset).limit(limit)
      end
    end
    return games
  end
end
