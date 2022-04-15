class VideoGame < ApplicationRecord
    belongs_to :user
    validates :name, presence:true, length: {minimum: 2, maximum: 100}
    validates :description, presence:true, length: {minimum: 6, maximum: 200}
end