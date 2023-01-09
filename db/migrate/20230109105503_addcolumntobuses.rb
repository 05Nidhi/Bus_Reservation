class Addcolumntobuses < ActiveRecord::Migration[7.0]
  def change
    add_column :buses, :no_of_seats, :integer
  end
end
