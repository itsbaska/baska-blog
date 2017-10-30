class SessionsController < ApplicationController

  def new
    render 'new'
  end

  def create
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:username], params[:password])
      session[:user_id] = user.id
      redirect_to '/posts'
    else
      flash[:danger] = "Invalid username or password"
      render 'new'
    end
  end



  def destroy
    User.find(session[:user_id]).destroy
    session[:user_id] = nil
    redirect_to '/'
  end

end