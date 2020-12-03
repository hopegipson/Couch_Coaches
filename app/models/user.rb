class User < ApplicationRecord
    has_many :user_teams
    has_many :teams, :through => :user_teams
    has_many :winning_games, through: :teams
    has_many :losing_games, through: :teams
    validates :first_name, presence: :true
    validates :last_name, presence: :true
    validates :email, presence: :true



    validates :username, presence: :true, uniqueness: :true
    has_secure_password

    def full_name
        "#{self.first_name} #{self.last_name}".titleize
    end

   
end
