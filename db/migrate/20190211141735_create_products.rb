class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string  :name,  null: false
      t.integer :original_price, default: 0
      t.integer :discount_price, default: 0
      t.string  :image
      t.timestamps
    end
  end
end
