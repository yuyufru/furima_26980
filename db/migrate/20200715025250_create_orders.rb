class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.integer :price  ,null: false
      t.references :user, null: false,foreign_key: true
      t.references :item, null: false
      t.string :post_code
      t.string :prefecture
      t.string :city
      t.string :house_number
      t.string :building_name
      t.string :phone_number
      t.timestamps     
    end
  end
end

