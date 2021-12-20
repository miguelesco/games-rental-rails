class CreateReservations < ActiveRecord::Migration[6.1]
  def change
    create_table :reservations do |t|
      t.date :reservation_date
      t.date :retrieval_date
      t.string :location
      t.references :buyer, null: false, foreign_key: { to_table: :users }, on_delete: :cascade
      t.references :game, null: false, foreign_key: true, on_delete: :cascade

      t.timestamps
    end
  end
end
