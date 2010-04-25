class DevelopersController < ApplicationController

  def index
    @level = params[:lv]
    @view = params[:action]
    if params[:search]
      @developers = Developer.where("LOWER(name) LIKE ?", "%#{params[:search].downcase}%")
    else
      @developers = Developer.order("name asc")
    end
    @partial = "index"
    respond_to do |format|
      format.js {
        if params[:search]
          render 'suggestion'
        else
          render 'pop_up'
        end
      }
      format.html {
        render :partial => 'index', :layout => 'application'
      }
    end
  end

  def new
    @title = "Add Developer"
    @developer = Developer.new
  end

  def edit
    @title = "Edit Developer"
    @developer = Developer.find(params[:id])
  end

  def create
    @developer = Developer.new(params[:developer])
    if @developer.save
      create_log_entry('developers', @developer.id, "Added developer #{@developer.name}.", :add => true)
      add_flash = experience_user(5)
      flash[:notice] = "Developer succesfully created." + add_flash
      redirect_to year_path
    else
      @title = "Add Developer"
      render :partial => 'new'
    end
  end

  def update
    @developer = Developer.find(params[:id])
    if @developer.update_attributes(params[:developer])
      create_log_entry('developers', @developer.id, "Modified developer #{@developer.name}.", :mod => true)
      add_flash = experience_user(3)
      flash[:notice] = "Developer succesfully updated." + add_flash
      redirect_to year_path
    else
      @title = "Add Developer"
      render :partial => 'edit'
    end
  end

  def destroy
    @developer = Developer.find(params[:id])
    if @developer.games.empty?
      if @developer.destroy
        create_log_entry('developers', @developer.id, "Deleted developer #{@developer.name}.", :remove => true)
        flash[:notice] = "Developer succesfully deleted."
      end
    else
      flash[:alert] = "Could not delete, there are games assigned to this developer."
    end
    redirect_to developers_path
  end

  def show
    @developer = Developer.find(params[:id])
    @games = @developer.games
    @games = @games.sort { |a,b| a.full_title <=> b.full_title }
  end

end
