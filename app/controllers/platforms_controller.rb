class PlatformsController < ApplicationController

  def index
    @platforms = Platform.where("LOWER(name) LIKE ?", "%#{params[:search].downcase}%").limit(10)
    respond_to do |format|
      format.js
    end
  end
end
