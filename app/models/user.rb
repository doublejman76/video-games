class User < ApplicationRecord
    has_secure_password
    has_many :video_games, dependent: :destroy
    validates :username, uniqueness: true, presence: true, length: {minimum: 3, maximum: 25}
    validates :email, uniqueness: true, presence: true, length: {maximum: 25}, format: { with: URI::MailTo::EMAIL_REGEXP }
end