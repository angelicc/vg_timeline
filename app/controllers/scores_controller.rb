class ScoresController < ApplicationController
  def new
    @score = Score.new
    @level = params[:lv]
    @view = params[:action]
    @game = Game.find(params[:game])
    @score.game = @game
    respond_to do |format|
      format.js { render 'pop_up' }
    end
  end

  def create
    @score = Score.new(params[:score])
    if @score.save
      flash[:notice] = "Score added succesfully."
      redirect_to game_path(@score.game)
    else
      flash[:alert] = "Could not add score."
      redirect_to game_path(@score.game)
    end
  end

end
