class CreateVideoGames < ActiveRecord::Migration[6.1]
  def change
    create_table :video_games do |t|
      t.string :title
      t.text :description
      t.string :genre
      t.integer :user_happiness_score
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
