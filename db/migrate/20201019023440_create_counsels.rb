class CreateCounsels < ActiveRecord::Migration[5.1]
  def change
    create_table :counsels do |t|
      t.date :day
      t.integer :start_time
      t.integer :end_time
      t.string :teacher

      t.timestamps
    end
  end
end
