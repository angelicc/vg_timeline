class PressController < ApplicationController
  def index
    @press = Press.where("LOWER(name) LIKE ?", "%#{params[:search].downcase}%")
    respond_to do |format|
      format.js
    end
  end

end
