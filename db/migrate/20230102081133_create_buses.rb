class CreateBuses < ActiveRecord::Migration[7.0]
  def change
    create_table :buses do |t|
      t.string :name
      t.string :source
      t.string :destination
      t.integer :seats
      t.integer :bus_registration_number

      t.timestamps
    end
  end
end
