class Feedback < ApplicationRecord
    attr_accessor :title, :description, :order_id
    validates :title, presence: true, length: { minimum: 3, maximum: 50 }
    validates :description, presence: true, length: { minimum: 10, maximum: 300 }
    belongs_to :order
   
end
