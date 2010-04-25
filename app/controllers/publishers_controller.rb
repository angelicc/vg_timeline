class PublishersController < ApplicationController

  def index
    @level = params[:lv]
    @view = params[:action]
    if params[:search]
      @publishers = Publisher.where("LOWER(name) LIKE ?", "%#{params[:search].downcase}%")
    else
      @publishers = Publisher.order("name asc")
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
        @format = "html"
        render :partial => 'index', :layout => 'application'
      }
    end
  end

  def new
    @title = "Add Publisher"
    @publisher = Publisher.new
  end

  def edit
    @title = "Edit Publisher"
    @publisher = Publisher.find(params[:id])
  end

  def create
    @publisher = Publisher.new(params[:publisher])
    if @publisher.save
      create_log_entry('publishers', @publisher.id, "Added publisher #{@publisher.name}.", :add => true)
      add_flash = experience_user(5)
      flash[:notice] = "Publisher succesfully created." + add_flash
      redirect_to year_path
    else
      @title = "Add Publisher"
      render :partial => 'new'
    end
  end

  def update
    @publisher = Publisher.find(params[:id])
    if @publisher.update_attributes(params[:publisher])
      create_log_entry('publishers', @publisher.id, "Modified publisher #{@publisher.name}.", :mod => true)
      add_flash = experience_user(3)
      flash[:notice] = "Publisher succesfully updated." + add_flash
      redirect_to year_path
    else
      @title = "Add Publisher"
      render :partial => 'edit'
    end
  end

  def destroy
    @publisher = Publisher.find(params[:id])
    if @publisher.games.empty?
      if @publisher.destroy
        create_log_entry('publishers', @publisher.id, "Deleted publisher #{@publisher.name}.", :remove => true)
        flash[:notice] = "Publisher succesfully deleted."
      end
    else
      flash[:alert] = "Could not delete, there are games assigned to this publisher."
    end
    redirect_to publishers_path
  end

  def show
    @publisher = Publisher.find(params[:id])
    @games = @publisher.games
    @games = @games.sort { |a,b| a.full_title <=> b.full_title }
  end

end
