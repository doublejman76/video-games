class CreateVideoGames < ActiveRecord::Migration[6.1]
  def change
    create_table :video_games do |t|
      t.string :name
      t.text :description
      t.string :genre
      t.integer :user_id
      t.timestamps
    end
  end
end
