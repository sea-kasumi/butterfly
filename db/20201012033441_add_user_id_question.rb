class AddUserIdQuestion < ActiveRecord::Migration[5.1]
  def change
    add_column :question, :user_id, :integer
  end
end
