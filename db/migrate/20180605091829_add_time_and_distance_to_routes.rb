class AddTimeAndDistanceToRoutes < ActiveRecord::Migration[5.2]
  def change
    add_column :routes, :time, :float, default: 0
    add_column :routes, :distance, :float, default: 0
  end
end
