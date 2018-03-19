class CommentsController < ApplicationController

  def create
    # authenticate!
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(params[:comment].permit(:body, :guest_name))
    
    current_user ? @comment.commentor = current_user : @comment.commentor = nil
    if @comment.save
      ep "i saved"
      redirect_to post_path(@post)
    else
      flash[:notice] = @comment.errors.full_messages
      redirect_to(@post) and return
    end
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
