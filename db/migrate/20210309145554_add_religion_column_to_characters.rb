class AddReligionColumnToCharacters < ActiveRecord::Migration[6.1]
  def change
    add_column :characters, :religion, :string, default: "None"
  end
end
