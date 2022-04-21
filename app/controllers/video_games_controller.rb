class VideoGamesController < ApplicationController
  before_action :set_video_game, only: [:show, :edit, :destroy, :update]
  before_action :require_user, except: [:show, :index]
  before_action :require_same_user, only: [:edit, :update, :destroy]

  def show
  end

  def index
      @video_games = VideoGame.paginate(page: params[:page], per_page: 8)
  end

  def new
      @video_game = VideoGame.new
  end

  def edit
  end

  def create
    @video_game = VideoGame.new(video_game_params)
    @video_game.user = current_user
    if @video_game.save
      flash[:notice] = "Arcade machine was added successfully"
      redirect_to @video_game
    else
      render'new'
    end
  end

  def update
    if @video_game.update(video_game_params)
      flash[:message] = "Update successful!"
      redirect_to @video_game
    else
      render 'edit'
    end    
  end

  def destroy
    flash[:message] = "#{@video_game.name} was successfully deleted."
    @video_game.destroy
    redirect_to video_games_path
  end

  private

  def set_video_game
    @video_game = VideoGame.find(params[:id])
  end

  def video_game_params
    params.require(:video_game).permit(:name, :description, :image_path)
  end

  def require_same_user
    if current_user !=@video_game.user && !current_user.admin?
      flash[:alert] = "You can only edit or delete your own video game"
      redirect_to @video_game
    end
  end

end