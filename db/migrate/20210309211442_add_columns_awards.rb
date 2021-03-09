class AddColumnsAwards < ActiveRecord::Migration[6.1]
  def change
    add_column :awards, :best_film, :string
    add_column :awards, :best_director, :string
    add_column :awards, :best_actor, :string
    add_column :awards, :best_actress, :string
    add_column :awards, :best_supporting_actor, :string
    add_column :awards, :best_supporting_actress, :string
    add_column :awards, :best_screenplay, :string
    add_column :awards, :best_cinematography, :string
    add_column :awards, :best_film_editing, :string
    add_column :awards, :best_score, :string
  end
end
