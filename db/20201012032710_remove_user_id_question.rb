class RemoveUserIdQuestion < ActiveRecord::Migration[5.1]
  def change
    remove_column :question, :user_id, :string
  end
end
