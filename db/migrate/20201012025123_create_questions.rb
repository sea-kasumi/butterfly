class CreateQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :questions do |t|
      t.string :user_id
      t.string :question

      t.timestamps
    end
  end
end
