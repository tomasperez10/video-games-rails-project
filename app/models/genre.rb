class Genre < ApplicationRecord
    has_many :video_games, through: :users
end
