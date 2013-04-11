class CreateLineitems < ActiveRecord::Migration
  def change
    create_table :lineitems do |t|
      t.integer :quantity
      t.decimal :price
      t.integer :order_id
      t.integer :product_id

      t.timestamps
    end
  end
end
