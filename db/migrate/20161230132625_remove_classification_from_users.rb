class RemoveClassificationFromUsers < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :classification
  end
end
