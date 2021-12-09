class CreateReservations < ActiveRecord::Migration[6.1]
  def change
    create_table :reservations do |t|
      t.date :reservation_date
      t.date :retrieval_date
      t.string :location
      t.references :buyer, null: false, foreign_key: { to_table: :users }
      t.references :game, null: false, foreign_key: true

      t.timestamps
    end
  end
end
