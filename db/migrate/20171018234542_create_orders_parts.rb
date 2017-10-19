class CreateOrdersParts < ActiveRecord::Migration[5.1]
  def change
    create_table :orders_parts do |t|
      t.references :order
      t.references :part
      t.integer :quantity_ordered, null: false
      t.integer :quantity_received
      t.timestamps
    end
  end
end
