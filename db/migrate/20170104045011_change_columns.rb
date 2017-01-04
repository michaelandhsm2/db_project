class ChangeColumns < ActiveRecord::Migration[5.0]
  def change
    remove_column :seasons, :start, :datetime
    remove_column :seasons, :end, :datetime

    add_column :seasons, :start_date, :datetime
    add_column :seasons, :end_date, :datetime


    remove_column :specials, :start, :datetime
    remove_column :specials, :end, :datetime

    add_column :specials, :start_date, :datetime
    add_column :specials, :end_date, :datetime
  end
end
