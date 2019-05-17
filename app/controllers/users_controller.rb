class UsersController < ApplicationController
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    puts @user
    if @user.save
      puts @user.id
      session[:user_id] = @user.id
      redirect_to root_path
    else
      redirect_to sign_up_path
    end
  end
  
  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password)
  end
end
