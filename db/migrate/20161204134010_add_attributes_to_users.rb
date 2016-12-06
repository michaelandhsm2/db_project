class AddAttributesToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :national_id, :string
    add_column :users, :birthdate, :date
    add_column :users, :phone, :string
    add_column :users, :cellphone, :string
    add_column :users, :address, :string
    add_column :users, :gender, :string
    add_column :users, :classification, :string
  end
end
