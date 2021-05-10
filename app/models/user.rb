class User < ApplicationRecord
    has_many :video_games
    has_many :genres, through: :video_games

    validates :email, :presence => true,
                    :uniqueness => true
    # validates :username, :presence => true,
    #                    :uniqueness => true

    has_secure_password
end
