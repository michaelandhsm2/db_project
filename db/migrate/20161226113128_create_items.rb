class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|


      t.text :description
      t.string :image
      t.integer :quantity
      t.integer :price
      t.belongs_to :store, index: true

      t.timestamps
    end
  end
end
