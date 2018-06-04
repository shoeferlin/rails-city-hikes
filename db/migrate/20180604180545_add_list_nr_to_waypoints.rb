class AddListNrToWaypoints < ActiveRecord::Migration[5.2]
  def change
    add_column :waypoints, :list_nr, :integer, default: 0
  end
end
