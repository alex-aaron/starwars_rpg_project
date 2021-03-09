class AddOrganizationColumnToCharacters < ActiveRecord::Migration[6.1]
  def change
    add_column :characters, :organization, :string, default: "None"
  end
end
