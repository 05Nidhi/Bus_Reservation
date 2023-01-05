class CreateTickets < ActiveRecord::Migration[7.0]
  def change
    create_table :tickets do |t|
      t.string :name
      t.string :ticket_source
      t.string :ticket_destination
      t.date :ticket_date

      t.timestamps
    end
  end
end
