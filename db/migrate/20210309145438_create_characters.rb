class CreateCharacters < ActiveRecord::Migration[6.1]
  def change
    create_table :characters do |t|
      t.string :name
      t.integer :planet_id
      t.integer :race_id
      t.string :occupation
      t.string :description

      t.timestamps
    end
  end
end
