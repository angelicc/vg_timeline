class ApplicationController < ActionController::Base
  protect_from_forgery

  def pop_up
    @level = params[:level]
    @file = params[:file]
    @title = "Add New Game"
    @game = Game.new
    @date = (params[:year] && params[:month]) ? Date.parse("#{params[:year]}-#{params[:month]}-01") : Date.today
    @platforms = Platform.all
    @developers = Developer.order("name asc").all
    @publishers = Publisher.order("name asc").all
    respond_to do |format|
      format.js { render 'pop_up' }
    end
  end

  def close_pop
    @level = params[:level]
    respond_to do |format|
      format.js
    end
  end

  private

  def create_log_entry(table, id, description, parameters)
    parameters = { :add => false, :mod => false, :remove => false }.merge(parameters)
    table = Table.where("name = ?", table).first
    log = Modification.new(:user => current_user, :table => table, :modified_id => id, :description => description,
      :added => parameters[:add], :modified => parameters[:mod], :removed => parameters[:remove])
    log.save
  end

  def experience_user(new_exp)
    current_user.update_attribute('exp', current_user.exp += new_exp)
    if current_user.exp >= current_user.level.exp_next_level and current_user.level.exp_next_level > 0
      next_level = Level.where("level = ?", current_user.level.level + 1).first
      current_user.update_attribute('level', next_level)
      " You've advanced to level #{current_user.level.level}. Congratulations."
    else
      " +#{new_exp} Exp. points."
    end
  end
end
