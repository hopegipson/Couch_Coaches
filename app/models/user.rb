class User < ApplicationRecord
    has_many :teams
    has_secure_password
end
