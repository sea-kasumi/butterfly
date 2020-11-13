class CreateHours < ActiveRecord::Migration[5.1]
  def change
    create_table :hours do |t|
      t.string :display
      t.time :start_time
      t.time :end_time

      t.timestamps
    end
  end
end
