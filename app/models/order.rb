class Order < ApplicationRecord
    validates_presence_of :order_id, :first_name, :last_name

    has_many :items, class_name: 'OrderItem', dependent: :delete_all
    
    has_many :feedbacks
    



end
