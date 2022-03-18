class VideoGamesController < ApplicationController

  def show
      @video_game = VideoGame.find(params[:id])
  end

  def index
      @video_games = VideoGame.all
  end

  def new
      @video_game = VideoGame.new
  end

  def edit
      @video_game = VideoGame.find(params[:id])
  end

  def create
    @video_game = VideoGame.new(name: params[:name], description: params[:description], genre: params[:genre])
    @video_game.save
  if  flash[:notice] = "Video Game was created successfully"
      redirect_to @video_games
  else
    render 'new'
  end
 end
end