class RemoveStartTimeCounsel < ActiveRecord::Migration[5.1]
  def change
    remove_column :counsels, :start_time, :integer
  end
end
