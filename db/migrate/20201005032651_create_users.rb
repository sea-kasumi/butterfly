class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :account
      t.string :password
      t.integer :grade
      t.integer :class
      t.integer :number
      t.string :name
      t.boolean :graduate
      t.boolean :teacher

      t.timestamps
    end
  end
end
