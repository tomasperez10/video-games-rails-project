class VideoGame < ApplicationRecord
  belongs_to :genre
  belongs_to :user


  def genre_attributes=(genre_attributes)
    genre_name = genre_attributes["name"]
    unless genre_name.blank?
      genre = Genre.find_or_create_by(name: name)
      self.genres << genre
    end
  end

end
