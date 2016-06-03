class AuthorsController < ApplicationController
  def index
    @authors = Author.all
  end

  def show
    @author = Author.find(params[:id])
  end

  def new
    @author = Author.new
  end

  def create
    @author = Author.new
    @author.name = params[:name]
    @author.bio = params[:bio]
    @author.image_url = params[:image_url]
    @author.dob = params[:dob]

    if @author.save
      redirect_to "/authors", :notice => "Author created successfully."
    else
      render 'new'
    end
  end

  def edit
    @author = Author.find(params[:id])
  end

  def update
    @author = Author.find(params[:id])

    @author.name = params[:name]
    @author.bio = params[:bio]
    @author.image_url = params[:image_url]
    @author.dob = params[:dob]

    if @author.save
      redirect_to "/authors", :notice => "Author updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @author = Author.find(params[:id])

    @author.destroy

    redirect_to "/authors", :notice => "Author deleted."
  end
end
