class CreateFeedbacks < ActiveRecord::Migration[6.1]
  def change
    create_table :feedbacks do |t|
      t.string :title, null: false
      t.text :description

      t.timestamps
    end
  end
end
