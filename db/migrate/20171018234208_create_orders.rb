class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.boolean :submitted, default: false
      t.boolean :processed, default: false
      t.integer :creator_id, index: true, foreign_key: true
      t.integer :processor_id, index: true, foreign_key: true

      t.timestamps
    end
  end
end
