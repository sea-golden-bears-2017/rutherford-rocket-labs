class CreateWarehouses < ActiveRecord::Migration[5.1]
  def change
    create_table :warehouses do |t|
      t.string :location, null: false
      t.timestamps
    end
  end
end
