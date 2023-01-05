class CreateSeatNumbers < ActiveRecord::Migration[7.0]
  def change
    create_table :seat_numbers do |t|
      t.integer :seat_no
      t.boolean :seat_status
      t.belongs_to :bus

      t.timestamps
    end
  end
end
