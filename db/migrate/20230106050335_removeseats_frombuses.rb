class RemoveseatsFrombuses < ActiveRecord::Migration[7.0]
  def change
    remove_column :buses, :seats, :integer
  end
end
