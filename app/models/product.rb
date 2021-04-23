class Product < ApplicationRecord
    belongs_to :category
    has_many :order_items
    validates_presence_of :title
    validates_numericality_of :price, :message=>"Error Message"
end
