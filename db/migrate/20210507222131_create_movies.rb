class CreateMovies < ActiveRecord::Migration[6.1]
  def change
    create_table :movies do |t|
      t.string :title
      t.string :original_title
      t.string :original_title_romanized
      t.string :image_url
      t.text :description
      t.string :director
      t.string :producer
      t.integer :release_date
      t.integer :run_time
      t.integer :rt_score

      t.timestamps
    end
  end
end
