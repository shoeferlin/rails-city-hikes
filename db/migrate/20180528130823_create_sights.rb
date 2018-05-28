class CreateSights < ActiveRecord::Migration[5.2]
  def change
    create_table :sights do |t|
      t.string :name
      t.text :description
      t.string :category
      t.string :picture_url
      t.float :lat
      t.float :lng

      t.timestamps
    end
  end
end
