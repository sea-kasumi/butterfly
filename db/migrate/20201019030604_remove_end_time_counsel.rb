class RemoveEndTimeCounsel < ActiveRecord::Migration[5.1]
  def change
    remove_column :counsels, :end_time, :integer
  end
end
