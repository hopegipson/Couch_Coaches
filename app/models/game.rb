class Game < ApplicationRecord
    has_one :competition
    has_one :home_team,:through => :competition
    has_one :visitor_team,:through => :competition

end
