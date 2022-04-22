class CreateVideoGameCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :video_game_categories do |t|
      t.integer :video_game_id
      t.integer :category_id
    end
  end
end
