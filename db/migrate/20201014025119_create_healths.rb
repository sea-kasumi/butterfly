class CreateHealths < ActiveRecord::Migration[5.1]
  def change
    create_table :healths do |t|
      t.integer :user_id
      t.integer :temperature
      t.string :condition
      t.string :symptom_id
      t.date :day

      t.timestamps
    end
  end
end
