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
      t.datetime    :start_date
      t.datetime    :end_date
      t.belongs_to  :store, index:true
      t.belongs_to  :events, index: true

    end

    create_table :specials do |t|

      t.integer     :discount
      t.belongs_to  :events, index: true

      t.datetime    :start_date
      t.datetime    :end_date

    end

    create_table :coupons do |t|


      t.integer     :minimum_spending
      t.integer     :free_cash
      t.belongs_to  :events, index: true

      t.datetime    :start_date
      t.datetime    :end_date

    end


    create_join_table :items, :coupons

    create_join_table :items, :specials
  end
end
