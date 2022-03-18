class VideoGame < ApplicationRecord
    validates :name, presence:true, length: {minimum: 2, maximum: 100}
    validates :description, presence:true, length: {minimum: 6, maximum: 200}
    validates :genre, presence:true, length: {minimum: 2, maximum: 100}
end