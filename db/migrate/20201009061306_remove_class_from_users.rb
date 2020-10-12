class RemoveClassFromUsers < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :class, :integer
  end
end
