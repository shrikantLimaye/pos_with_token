class AddCascadeToOrderitems < ActiveRecord::Migration[6.1]
  def up
    remove_foreign_key :order_items, :orders
    add_foreign_key :order_items, :orders, on_delete: :cascade
  end

  def down
    remove_foreign_key :order_items, :orders
    add_foreign_key :order_items, :orders
  end
end
