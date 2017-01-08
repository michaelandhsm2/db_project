class AddStoreUserAssociation < ActiveRecord::Migration[5.0]
  def change
    create_join_table :users, :stores

    add_reference :stores, :user, index: true
  end
end
