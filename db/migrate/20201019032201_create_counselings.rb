class CreateCounselings < ActiveRecord::Migration[5.1]
  def change
    create_table :counselings do |t|
      t.integer :hour_id
      t.integer :user_id
      t.integer :counsel_id

      t.timestamps
    end
  end
end
