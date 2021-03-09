class ChangeDescriptionColumnCharacters < ActiveRecord::Migration[6.1]
  def change
    change_column :characters, :description, :text
  end
end
