class AddEndTimeCounsel < ActiveRecord::Migration[5.1]
  def change
    add_column :counsels, :end_time, :time
  end
end
