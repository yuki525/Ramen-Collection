class RenameCusomerIdColumnToComments < ActiveRecord::Migration[5.2]
  def change
    rename_column :comments, :cusomer_id, :customer_id
  end
end
