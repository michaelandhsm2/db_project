class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|

      t.string    :name
      t.text      :description
      t.references :event_code, polymorphic: true, index: true

      t.timestamps
    end


    create_table :shippings do |t|

      t.integer     :minimum_spending
      t.integer     :discount
      t.belongs_to  :events, index: true

    end

    create_table :seasons do |t|

      t.integer    :discount
      t.datetime    :start
      t.datetime    :end
      t.belongs_to  :events, index: true

    end

    create_table :specials do |t|


      t.integer     :minimum_spending
      t.integer     :discount
      t.integer     :free_cash
      t.belongs_to  :events, index: true

      t.datetime    :start
      t.datetime    :end

    end

    create_table :specials_items, id: false do |t|
      t.belongs_to :item, index: true
      t.belongs_to :special, index: true
    end
  end
end
