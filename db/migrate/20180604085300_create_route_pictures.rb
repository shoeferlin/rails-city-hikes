class CreateRoutePictures < ActiveRecord::Migration[5.2]
  def change
    create_table :route_pictures do |t|
      t.references :route, foreign_key: true
      t.string :route_picture

      t.timestamps
    end
  end
end
