class User < ApplicationRecord
    has_many :teams
    has_many :winning_games, through: :teams
    has_many :losing_games, through: :teams
    has_secure_password
end
