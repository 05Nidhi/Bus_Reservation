class Removecolumnfromtickets < ActiveRecord::Migration[7.0]
  def change
    remove_column :tickets, :seat_no, :integer

  end
end
