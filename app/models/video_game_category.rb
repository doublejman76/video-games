class VideoGameCategory < ApplicationRecord
  belongs_to :video_game
  belongs_to :category
end