class Order < ApplicationRecord
   

    has_many :items, class_name: 'OrderItem', dependent: :delete_all
    
    has_many :feedbacks
    



end
