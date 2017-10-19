class CreateParts < ActiveRecord::Migration[5.1]
  def change
    create_table :parts do |t|
      t.string :name, null: false, unique: true
      t.integer :min
      t.integer :max

      t.timetamps
    end
  end
end
