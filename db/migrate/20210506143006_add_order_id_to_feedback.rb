class AddOrderIdToFeedback < ActiveRecord::Migration[6.1]
  def change
    add_column :feedbacks, :order_id, :integer
  end
end
