class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.boolean :submitted, default: false
      t.boolean :processed, default: false
      t.integer :creator_id
      t.integer :processor_id

      t.timestamps
    end
  end
end
