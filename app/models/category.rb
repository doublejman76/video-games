class Category < ApplicationRecord
    validates :name, presence: true, length: { minimum: 3, maximum: 25 }
    validates_uniqueness_of :name
    has_many :video_game_categories
    has_many :video_games, through: :video_game_categories
  end