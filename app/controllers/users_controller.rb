class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    p user_params
    @user = User.new(user_params)
    if @user.save
      p "yes saved"
      flash[:notice] = "You signed up successfully!"
      session[:user_id] = @user.id
      redirect_to '/'
    else
      p 'not saved'
      flash[:notice] = "Form is invalid"
      render 'new'
    end
  end


  private
  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end
end
