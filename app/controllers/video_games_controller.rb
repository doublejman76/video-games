class VideoGamesController < ApplicationController

  def show
      @video_games = VideoGame.find(params[:id])
  end

  def index
      @video_games = VideoGame.all
  end

  def new
      
  end

  def create
    @video_games = VideoGame.new(name: params[:name], description: params[:description])
    @video_games.save
    redirect_to @video_games
  if @video_games.save
      flash[:notice] = "Video Game was created successfully"
      redirect_to @video_games
  else
    render 'new'
  end
 end
end