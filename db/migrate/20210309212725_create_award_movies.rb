class CreateAwardMovies < ActiveRecord::Migration[6.1]
  def change
    create_table :award_movies do |t|
      t.integer :movie_id
      t.integer :award_id

      t.timestamps
    end
  end
end
