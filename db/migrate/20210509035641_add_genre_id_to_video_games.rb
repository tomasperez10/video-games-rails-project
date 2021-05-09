class AddGenreIdToVideoGames < ActiveRecord::Migration[6.1]
  def change
    add_column :video_games, :genre_id, :integer
  end
end
