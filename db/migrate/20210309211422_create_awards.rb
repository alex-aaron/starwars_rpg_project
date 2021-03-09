class CreateAwards < ActiveRecord::Migration[6.1]
  def change
    create_table :awards do |t|
      t.string :year
      t.integer :user_id

      t.timestamps
    end
  end
end
