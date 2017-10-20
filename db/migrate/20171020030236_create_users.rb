class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :username, null: false
      t.boolean :admin, default: false
      t.string :password_digest

      t.timestamps
    end
  end
end
