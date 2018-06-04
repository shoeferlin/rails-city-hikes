class AddListNrToSights < ActiveRecord::Migration[5.2]
  def change
    add_column :sights, :list_nr, :integer
  end
end
