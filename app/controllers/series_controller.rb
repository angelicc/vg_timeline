class SeriesController < ApplicationController

  def index
    @series = Series.where("name LIKE ?", "%#{params[:search]}%")
    respond_to do |format|
      format.js
    end
  end

end
