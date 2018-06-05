class AddNoExportsToRoute < ActiveRecord::Migration[5.2]
  def change
    add_column :routes, :no_exports, :integer, default: 0
  end
end
