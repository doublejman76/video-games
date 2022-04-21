class VideoGame < ApplicationRecord
    belongs_to :user

    has_many :video_game_categories
    has_many :categories, through: :video_game_categories


    validates :name, presence: true, length: {minimum: 2, maximum: 100}
    validates :description, presence: true, length: {minimum: 6, maximum: 5000}
    
end