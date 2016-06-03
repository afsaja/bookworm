class CommentsController < ApplicationController
  def index
    @mycomments = current_user.comments
  end

  def show
    @comment = Comment.find(params[:id])
  end

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new
    @comment.body = params[:body]
    @comment.user_id = params[:user_id]
    @comment.book_id = params[:book_id]

    if @comment.save
      redirect_to "/comments", :notice => "Comment created successfully."
    else
      render 'new'
    end
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])

    @comment.body = params[:body]
    @comment.user_id = params[:user_id]
    @comment.book_id = params[:book_id]

    if @comment.save
      redirect_to "/comments", :notice => "Comment updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @comment = Comment.find(params[:id])

    @comment.destroy

    redirect_to "/comments", :notice => "Comment deleted."
  end
end
