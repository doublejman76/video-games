class AddImagePathToVideoGames < ActiveRecord::Migration[6.1]
  def change
    add_column :video_games, :image_path, :string, :default => "https://2.bp.blogspot.com/-8REThO2LVYI/WepVWW-Ed7I/AAAAAAAAQJs/t7zGiTQAxW0Gln0hA7e2-Njizs--h54LwCLcBGAs/s400/ArcadeGames.jpg"
  end
end
