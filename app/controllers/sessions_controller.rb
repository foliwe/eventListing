class SessionsController < ApplicationController

  def new
    
  end

  def create
    user = User.friendly.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to (session[:intended_url] || user),
                   notice: "Welcome back, #{user.name}!"
       session[:intended_url]= nil 
    else
      flash.now[:alert] = "Invalid email or password, try again"
      render :new
    end
    
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "You are signed Out"
  end
end
