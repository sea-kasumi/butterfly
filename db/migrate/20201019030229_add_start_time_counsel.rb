class AddStartTimeCounsel < ActiveRecord::Migration[5.1]
  def change
    add_column :counsels, :start_time, :time
  end
end
