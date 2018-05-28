class CreateWaypoints < ActiveRecord::Migration[5.2]
  def change
    create_table :waypoints do |t|
      t.references :route, foreign_key: true, index: true
      t.references :sight, foreign_key: true, index: true

      t.timestamps
    end
  end
end
