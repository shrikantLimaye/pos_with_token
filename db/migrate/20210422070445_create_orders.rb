class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.decimal :sub_total, precision: 15, scale: 2, default: 0

      t.timestamps
    end
  end
end
