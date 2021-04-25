class UsersController < ApplicationController
  before_action :authenticate_user, except: [:new, :create]
  before_action :verify_ower, except:[:index, :show, :new, :create]
  before_action :set_user , only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def show
    @liked_events = @user.liked_events
    @registrations = @user.registrations
  end

  def create
    @user = User.new user_params
    if @user.save
      session[:user_id] = @user.id
        redirect_to @user, notice: "Thanks for signing up"
     else
      render :new
     end
  end

  def edit
    
  end

  def update
     if @user.update(user_params)
        redirect_to @user, notice: "Profile updated successfully"
     else
      render :edit
     end
  end

  
def destroy
  @user.destroy
  session[:user_id] = nil
  redirect_to users_path, notice: "Account successfully deleted"
end


  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def verify_ower
    @user = User.find(params[:id])
      redirect_to events_path unless current_user?(@user)
  end
end
