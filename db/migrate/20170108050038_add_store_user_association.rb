class AddStoreUserAssociation < ActiveRecord::Migration[5.0]
  def change
    create_join_table :users, :stores

    add_column :stores, :owner_id, :integer
    add_index :stores, :owner_id
  end
end
