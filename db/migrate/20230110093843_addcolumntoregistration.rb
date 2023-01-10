class Addcolumntoregistration < ActiveRecord::Migration[7.0]
  def change
    add_column :registrations, :flag, :boolean, :default => false
  end
end
