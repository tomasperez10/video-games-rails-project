class Genre < ApplicationRecord
    has_many :video_games
    has_many :users, through: :video_games
end
