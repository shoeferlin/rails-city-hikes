class AddPlaceIdUrlWebsiteFormattedAddressToSights < ActiveRecord::Migration[5.2]
  def change
    add_column :sights, :place_id, :string
    add_column :sights, :url, :string
    add_column :sights, :website, :string
    add_column :sights, :formatted_address, :string
  end
end
