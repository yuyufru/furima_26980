class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.text :image, null: false
      t.string :name, null: false
      t.text :info, null: false
      t.integer :category, null: false
      t.integer :status, null: false
      t.integer :price, null: false
      t.integer :price_tax, null: false
      t.integer :brand, null: false
      t.references :user, null: false, foreign_key: true
      t.timestamps
     
    end
  end
end
