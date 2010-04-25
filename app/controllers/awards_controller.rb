class AwardsController < ApplicationController
  def new
    @award = Award.new
    @level = params[:lv]
    @view = params[:action]
    @game = Game.find(params[:game])
    @award.game = @game
    respond_to do |format|
      format.js { render 'pop_up' }
    end
  end

  def create
    @award = Award.new(params[:award])
    if @award.save
      flash[:notice] = "Award added succesfully."
      redirect_to game_path(@award.game)
    else
      flash[:alert] = "Could not add award."
      redirect_to game_path(@award.game)
    end
  end

end
