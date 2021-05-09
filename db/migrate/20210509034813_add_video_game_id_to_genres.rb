class AddVideoGameIdToGenres < ActiveRecord::Migration[6.1]
  def change
    add_column :genres, :video_game_id, :integer
  end
end
