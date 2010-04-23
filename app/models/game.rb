class Game < ActiveRecord::Base
  attr_accessor :boxart_dir
  belongs_to :platform
  belongs_to :game_type
  belongs_to :series
  belongs_to :market
  belongs_to :rating
  belongs_to :local_multi_modes, :class_name => "MultiplayerMode", :foreign_key => :local_multi_modes_id
  belongs_to :online_multi_modes, :class_name => "MultiplayerMode", :foreign_key => :online_multi_modes_id
  belongs_to :sequel, :class_name => "Game", :foreign_key => :sequel_id
  belongs_to :prequel, :class_name => "Game", :foreign_key => :prequel_id
  belongs_to :re_release, :class_name => "Game", :foreign_key => :re_release_id
  belongs_to :remake, :class_name => "Game", :foreign_key => :remake_id
  has_and_belongs_to_many :achievements
  has_and_belongs_to_many :developers
  has_and_belongs_to_many :publishers
  has_and_belongs_to_many :features
  has_and_belongs_to_many :genres
  has_and_belongs_to_many :peripherals
  has_and_belongs_to_many :specifications
  has_and_belongs_to_many :types
  has_and_belongs_to_many :different_markets, :class_name => "Game", :join_table => :different_markets_games, :foreign_key => :different_market_id
  has_and_belongs_to_many :different_platforms, :class_name => "Game", :join_table => :different_platforms_games, :foreign_key => :different_platform_id
  has_many :scores
  has_many :press, :through => :scores
  has_many :project_leaders
  has_many :industry_people, :through => :project_leaders
  has_many :awards

  validates_presence_of :main_title, :release_date
  has_attached_file :boxart, :storage => :s3, :s3_credentials => "#{RAILS_ROOT}/config/s3.yml", :url => "/images/:release_year/:release_month/:style/:title", :styles => { :medium => "400x400>", :thumb => "120x120>", :mini => "50x50>" }, :path => "/images/:release_year/:release_month/:style/:title"

  def full_title
    main_title + " " + sub_title
  end

  def full_title_colon
    f_t = main_title
    if sub_title.empty?
      f_t
    else
      f_t = "#{f_t}:" if main_title.rindex(':').nil? and sub_title.rindex(':').nil?
      f_t = "#{f_t} #{sub_title}"
    end
  end

  def full_title_colon_limit
    if full_title_colon.length > 50
      "#{full_title_colon.slice(0, 49)}..."
    else
      full_title_colon
    end
  end

  def full_title_limit
    if full_title.length > 50
      "#{full_title.slice(0,49)}..."
    else
      full_title
    end
  end

  def added_by
    table = Table.where("name = ?", 'games').first
    Modification.where("new = true and table_id = ? and modified_id = ?", table.id, self.id).first
  end

  def modified_by
    table = Table.where("name = ?", 'games').rirst
    Modification.where("modified = true and table_id = ? and modified_id = ?", table.id, self.id).all
  end

  def r_d
    release_date.strftime('%d')
  end

  def r_m
    release_date.strftime('%m')
  end

  def r_m_t
    release_date.strftime('%B')
  end

  def r_y
    release_date.strftime('%Y')
  end

  def boxart_path
    unless boxart == "empty_boxart"
      "#{r_y}/#{r_m}/#{boxart}"
    else
      boxart
    end
  end

  def year_dir
    File.expand_path("#{Rails.root}/public/images/#{r_y}")
  end

  def month_dir
    File.expand_path("#{Rails.root}/public/images/#{r_y}/#{r_m}")
  end

  def same_file?(prev_file, new_file)
    return true if FileUtils.compare_file(prev_file, new_file)
    return false
  end

  def platform_name
    platform.name if platform
  end

  def platform_name=(name)
    self.platform = Platform.find_or_create_by_name(name) unless name.blank? # TODO cannot create platform if not assigned a short_name
  end

  def series_name
    series.name if series
  end

  def series_name=(name)
    self.series = Series.find_or_create_by_name(name) unless name.blank?
  end

  #  def different_platforms
  #    different_platforms
  #  end
  #
  #  def different_platforms=(game)
  #    self.different_platforms << game
  #  end

  def developer_names
    devs = []
    if developers
      for developer in developers
        devs << developer.name
      end
    end
    devs.split.join(", ")
  end

  def developer_names=(names)
    devs = []
    dev_names = names.split(",")
    temp_developers = []
    for name in dev_names
      temp_developers << Developer.find_or_create_by_name(name.strip) unless name.blank?
    end
    self.developers = temp_developers unless temp_developers.empty?
  end

  def publisher_names
    pbs = []
    if publishers
      for publisher in publishers
        pbs << publisher.name
      end
    end
    pbs.split.join(", ")
  end

  def publisher_names=(names)
    pbs = []
    pb_names = names.split(",")
    temp_publishers = []
    for name in pb_names
      temp_publishers << Publisher.find_or_create_by_name(name.strip) unless name.blank?
    end
    self.publishers = temp_publishers unless temp_publishers.empty?
  end

  def press_names
    prs = []
    if press
      for pressx in press
        prs << pressx.name
      end
    end
    prs.split.join(", ")
  end

  def press_names=(name)
    press_nm = Press.find_or_create_by_name(name.strip) unless name.blank?
    self.press << press_nm unless press.includes?(press_nm)
  end

  def make_boxart_path
    name = main_title
    name = "#{main_title} #{sub_title}" if sub_title
    box_name = name.downcase
    box_name = box_name.tr("\'\"", "")
    box_name = box_name.tr('.:;-/\\', " ")
    box_name = box_name.split.join('_')
    #    self.boxart = "#{box_name}_#{platform.short_name}"
  end

  private

  def save_file
    if not boxart_dir and not id
      empty_boxart_path
    else
      if !File.exists?(year_dir)
        Dir.mkdir(year_dir)
      end
      if !File.exists?(month_dir)
        Dir.mkdir(month_dir)
      end
      if boxart_dir
        FileUtils.copy(boxart_dir.local_path, file_path)
      end
    end
  end

  def file_path
    filename = make_boxart_path
    File.expand_path("#{RAILS_ROOT}/public/images/#{r_y}/#{r_m}/#{filename}")
  end

  def empty_boxart_path
    self.boxart = "empty_boxart"
  end
end
