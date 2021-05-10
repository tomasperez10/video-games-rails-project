class VideoGame < ApplicationRecord
  belongs_to :genre
  belongs_to :user

  validates :title, :presence => true
  
  validates :description, :presence => true

  def genre_name=(name)
    self.genre = Genre.find_or_create_by(name: name)
  end

  def genre_name
    self.genre ? self.genre.name : nil
  end

end
