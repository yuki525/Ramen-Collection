class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.integer :cusomer_id
      t.integer :post_id
      t.text :body
      t.float :evaluation

      t.timestamps
    end
  end
end
