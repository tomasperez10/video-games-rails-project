class CreateGameGenres < ActiveRecord::Migration[6.1]
  def change
    create_table :game_genres do |t|
      t.integer :video_game_id
      t.integer :genre_id
      t.belongs_to :video_games, null: false, foreign_key: true
      t.belongs_to :genres, null: false, foreign_key: true

      t.timestamps
    end
  end
end
