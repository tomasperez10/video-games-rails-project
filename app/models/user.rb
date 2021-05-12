class User < ApplicationRecord
    has_many :video_games
    has_many :genres, through: :video_games

    validates :email, :presence => true,
                    :uniqueness => true
    # validates :username, :presence => true,
    #                    :uniqueness => true

    has_secure_password

    def self.from_omniauth(response)
        User.find_or_create_by(uid: response[:uid], provider: response[:provider]) do |u|
            u.username = response[:info][:username]
            u.email = response[:info][:email]
            u.password = SecureRandom.hex(15)
        end
    end
end
