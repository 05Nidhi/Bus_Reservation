class Addcolumn < ActiveRecord::Migration[7.0]
  def change
    add_column :tickets, :ticket_seat_no, :integer

  end
end
