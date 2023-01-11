class Addcolumntoseatnumber < ActiveRecord::Migration[7.0]
  def change
    add_column :seat_numbers, :seat_date, :date
  end
end
