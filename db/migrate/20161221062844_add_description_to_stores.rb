class AddDescriptionToStores < ActiveRecord::Migration[5.0]
  def change
    add_column :stores, :description, :text
    add_column :stores, :image, :string
  end
end
