class CreatePartsWarehouses < ActiveRecord::Migration[5.1]
  def change
    create_table :parts_warehouses do |t|
      t.references :warehouse
      t.references :part
      t.integer :quantity
      t.timestamps
    end
  end
end
