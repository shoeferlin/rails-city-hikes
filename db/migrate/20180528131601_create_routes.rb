class CreateRoutes < ActiveRecord::Migration[5.2]
  def change
    create_table :routes do |t|
      t.string :name
      t.text :description
      t.boolean :public
      t.references :user, foreign_key: true, index: true
      t.references :city, foreign_key: true, index: true

      t.timestamps
    end
  end
end
