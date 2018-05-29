class CreateHikedRoutes < ActiveRecord::Migration[5.2]
  def change
    create_table :hiked_routes do |t|
      t.references :user, foreign_key: true, index: true
      t.references :route, foreign_key: true, index: true

      t.timestamps
    end
  end
end
