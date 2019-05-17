class SessionsController < ApplicationController
	def new
  end
  
  def create
    @user = User.find_by_email(params[:session][:email])
  	if @user && @user.authenticate(params[:session][:password])
      puts "found user"
      session[:user_id] = @user.id
      puts session[:user_id]
      redirect_to root_path
    else
      redirect_to 'login'
    end
  end
  
  def destroy
    session[:user_id] = nil 
  	redirect_to root_path 
  end
end
