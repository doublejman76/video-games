class VideoGamesController < ApplicationController
  before_action :set_video_game, only: [:show, :edit, :destroy, :update]

  def show
  end

  def index
      @video_games = VideoGame.all
  end

  def new
      @video_game = VideoGame.new
  end

  def edit
  end

  def create
    @video_game = VideoGame.new(video_games_params)
    if @video_game.save
      flash[:notice] = "Video Game was created successfully"
      redirect_to @video_game
    else
      render'new'
    end
  end

  def update
    if @video_game.update(video_games_params)
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

  def video_games_params
    params.require(:video_game).permit(:name, :description, :genre)
  end

end