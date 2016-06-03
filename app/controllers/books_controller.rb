class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new
    @book.title = params[:title]
    @book.image_url = params[:image_url]
    @book.author_id = params[:author_id]
    @book.description = params[:description]
    @book.length = params[:length]
    @book.year = params[:year]

    if @book.save
      redirect_to "/books", :notice => "Book created successfully."
    else
      render 'new'
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])

    @book.title = params[:title]
    @book.image_url = params[:image_url]
    @book.author_id = params[:author_id]
    @book.description = params[:description]
    @book.length = params[:length]
    @book.year = params[:year]

    if @book.save
      redirect_to "/books", :notice => "Book updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @book = Book.find(params[:id])

    @book.destroy

    redirect_to "/books", :notice => "Book deleted."
  end
end
