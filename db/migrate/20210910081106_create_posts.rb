class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.integer :customer_id
      t.string :shop_name
      t.string :address
      t.text :introduction
      t.string :taste
      t.string :noodle_hardness

      t.timestamps
    end
  end
end
