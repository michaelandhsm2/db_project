class AddStoreToSeason < ActiveRecord::Migration[5.0]
  def change
    add_reference :seasons, :store, index: true

  end
end
