class VideoGame < ApplicationRecord
  belongs_to :genre
  belongs_to :user

  # default_scope { order("title") }

  scope :longest_title, -> { order("LENGTH(title) DESC").first.title(&:length) }

  validates :title, :presence => true
  
  validates :description, :presence => true

  def genre_name=(name)
    self.genre = Genre.find_or_create_by(name: name)
  end

  def genre_name
    self.genre ? self.genre.name : nil
  end

end
