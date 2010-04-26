module ApplicationHelper

  def pop_up(text, path, lev = { :level => 1 })
    lev[:level] = 1 if lev[:level].to_i < 1 or lev[:level].to_i > 4
    #    path = "#{path}&lv=#{lev[:level]}"
    if path.slice(0,1) == "/"
      path =  path.slice(1, path.length)
    end
    path = path.slice(path.rindex("/") + 1, path.length) if path.rindex("/")
    link_to text, { :action => path.index("?") ? path.slice(0, path.index("?")) : path, :lv => path.index("?") ? "#{lev[:level]}&#{path.slice(path.index("?") + 1, path.length)}" : lev[:level] }, :remote => true
  end

  def pop_up_controller(text, path, controller, lev)
    lev[:level] = lev[:level] ? leve[:level] : 1
    link_to text, { :action => path, :controller => controller, :lv => lev[:level], :game => lev[:game_id] }, :remote => true
  end

  def close_button
    link_to(image_tag("window-close.png", :class => "window_close"), { :controller => 'games', :action => 'close_pop', :level => @level }, :remote => true)
  end

  def cur_date_year(year)
    Date.parse(year.to_s+"-#{Date.today.month.to_s}"+"-#{Date.today.day.to_s}")
  end

  def cur_date_year_month(year, month)
    Date.parse(year.to_s+"-"+month.to_s+"-#{Date.today.day.to_s}")
  end

  def cur_date_month(month)
    Date.parse("#{Date.today.year.to_s}"+"-"+month.to_s+"-#{Date.today.day.to_s}")
  end

  def cur_date_day(day)
    Date.parse("#{Date.today.year.to_s}"+"-#{Date.today.month.to_s}"+"-"+day.to_s)
  end

  def cur_date_all(year, month, day)
    Date.parse(year.to_s+"-"+month.to_s+"-"+day.to_s)
  end

  def cur_year
    Date.today.year
  end

  def cur_month
    Date.today.month
  end

  def cur_day
    Date.today.day
  end

  def month_name(month_number)
    if month_number == 1
      return "January"
    elsif month_number == 2
      return "February"
    elsif month_number == 3
      return "March"
    elsif month_number == 4
      return "April"
    elsif month_number == 5
      return "May"
    elsif month_number == 6
      return "June"
    elsif month_number == 7
      return "July"
    elsif month_number == 8
      return "August"
    elsif month_number == 9
      return "September"
    elsif month_number == 10
      return "October"
    elsif month_number == 11
      return "November"
    elsif month_number == 12
      return "December"
    end
  end

  def last_year
    3.years.since(Date.today).year
  end

  def close_button
    image_tag("window-close.png", :class => "window_close")
  end
end
