class ChangeCityNameToLocality < ActiveRecord::Migration[5.2]
  def change
    rename_column :cities, :name, :locality
  end
end
