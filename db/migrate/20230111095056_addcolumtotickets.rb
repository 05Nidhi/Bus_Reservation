class Addcolumtotickets < ActiveRecord::Migration[7.0]
  def change
    add_column :tickets, :bus_id, :integer

  end
end
