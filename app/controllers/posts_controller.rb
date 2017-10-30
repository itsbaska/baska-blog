class PostsController < ApplicationController
  def index
    @posts = Post.all.order('created_at DESC')
  end

  def new
    authenticate!
    @post = Post.new
  end

  def create
    authenticate!
    @post = Post.new(post_params)
    @post.author = current_user
    if @post.save
      redirect_to @post
    else
      render 'new'
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    authenticate!
    @post = Post.find(params[:id])
  end

  def update
    authenticate!
    @post = Post.find(params[:id])
    authorize!(@post.author)
    if @post.update(params[:post].permit(:title, :body))
      redirect_to @post
    else
      render 'edit'
    end 
  end 

  def destroy
    authenticate!
    @post = Post.find(params[:id])
    authorize!(@post.author)
    @post.destroy
    redirect_to root_path
  end

  private
  def post_params
    params.require(:post).permit(:title, :body)
  end
end
