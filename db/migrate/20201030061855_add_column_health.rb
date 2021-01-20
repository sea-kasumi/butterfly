class AddColumnHealth < ActiveRecord::Migration[5.1]
  def change
    add_column :healths, :symptom_id, :integer
  end
end
