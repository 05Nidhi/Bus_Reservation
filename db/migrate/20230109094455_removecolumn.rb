class Removecolumn < ActiveRecord::Migration[7.0]
  def change
    remove_column :tickets, :ticket_seat_no, :integer

  end
end
