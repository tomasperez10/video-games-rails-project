class VideoGame < ApplicationRecord
  belongs_to :genre
  belongs_to :user

  validates :title, presence: true
  validates :user_happiness_score, presence: true, numericality: {greater_than_or_equal_to: 0, less_than_or_equal_to: 10}

  def genres_attributes=(genre_attributes)
    genre_name = genre_attributes["0"]["name"]
    unless genre_name.blank?
      genre = Genre.find_or_create_by(name: genre_name)
      self.genres << genre
    end
  end

end
