class CreateSymptoms < ActiveRecord::Migration[5.1]
  def change
    create_table :symptoms do |t|
      t.string :display
      t.integer :disporder

      t.timestamps
    end
  end
end
