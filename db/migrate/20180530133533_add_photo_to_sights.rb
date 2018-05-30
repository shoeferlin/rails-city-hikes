class AddPhotoToSights < ActiveRecord::Migration[5.2]
  def change
    add_column :sights, :photo, :string
  end
end
