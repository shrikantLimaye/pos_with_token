class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :title, null: false
      t.text :description
      t.integer :category_id
      t.decimal :price, precision: 15, scale: 2, default: 0

      t.timestamps
    end
  end
end
