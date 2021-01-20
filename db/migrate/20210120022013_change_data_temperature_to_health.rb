class ChangeDataTemperatureToHealth < ActiveRecord::Migration[5.1]
  def change
    change_column :healths, :temperature, :float
  end
end
