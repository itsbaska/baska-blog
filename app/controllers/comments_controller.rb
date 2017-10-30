class CommentsController < ApplicationController

  def create
    authenticate!
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(params[:comment].permit(:body))
    @comment.commentor = current_user
    @comment.save
    redirect_to post_path(@post)
  end

  def edit
    authenticate!
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
  end

  def update
    authenticate!
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    authorize!(@comment.commentor)

    if @comment.update(params[:comment].permit(:body))
      redirect_to post_path(@post)
    else
      render 'edit'
    end
  end

  def destroy
    authenticate!
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    authorize!(@comment.commentor)
    @comment.destroy

    redirect_to post_path(@post)
  end
end
