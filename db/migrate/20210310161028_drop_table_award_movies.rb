class DropTableAwardMovies < ActiveRecord::Migration[6.1]
  def change
    drop_table :award_movies
  end
end
