class CreateGames < ActiveRecord::Migration[6.1]
  def change
    create_table :games do |t|
      t.string :name
      t.string :description
      t.string :icon
      t.integer :price
      t.string :category
      t.references :owner, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
