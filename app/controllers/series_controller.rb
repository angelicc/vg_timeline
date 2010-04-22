class SeriesController < ApplicationController

  def index
    @series = Series.where("LOWER(name) LIKE ?", "%#{params[:search].downcase}%")
    respond_to do |format|
      format.js
    end
  end

end
