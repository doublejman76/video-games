class VideoGamesController < ApplicationController
  def show
    @video_games = VideoGames.find(params[:id])
  end
end