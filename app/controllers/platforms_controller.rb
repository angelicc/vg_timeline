class PlatformsController < ApplicationController

  def index
    @platforms = Platform.where("name LIKE ?", "%#{params[:search]}%")
    respond_to do |format|
      format.js
    end
  end
end
