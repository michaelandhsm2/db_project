class RemoveTypeFromEvent < ActiveRecord::Migration[5.0]
  def change
    remove_column :events, :type, :integer
  end
end
