class CreateWarehouses < ActiveRecord::Migration[5.1]
  def change
    create_table :warehouses do |t|
      t.string :name, null: false
      t.string :location, null: false
      t.timestamps
    end
  end
end
