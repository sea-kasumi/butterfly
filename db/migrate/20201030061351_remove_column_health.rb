class RemoveColumnHealth < ActiveRecord::Migration[5.1]
  def change
    remove_column :healths, :symptom_id, :string
  end
end
