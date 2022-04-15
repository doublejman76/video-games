class UsersController < ApplicationController 
  {before_action :set_user, only: [:show, :edit, :update, :destroy]

  def show
    @video_games = @user.video_games
  end

  def index
    @users = User
  end

  def new
    @user = User.new
  end

  def edit
  end

  def update
    if @user.update(user_params)
      flash[:notice] = "Your account information was successfully updated"
      redirect_to @user
    else 
      render 'edit'
    end
  end

  def create
    @user = User(user_params)
    if @user.save
      flash[:notice] = "Welcome to Video Games #{@user.username}, you have successfully signed up"
      redirect_to video_games_path
    else
      render'new'
    end
 end

  def destroy
    @user.destroy
    session[:user_id] = nil if @user == current_user
    flash[:notice] = "Account and all saved games will be deleted"
    return_to video_games_path
  end

  private
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

  def set_user
    @user = User.find(params[:id])
  end

end}