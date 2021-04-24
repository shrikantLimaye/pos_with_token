class ShoppingCart

    delegate :sub_total, to: :order 

    def initialize(token:)
        @token = token
    end

    def order
        @order ||= Order.find_or_create_by(token: @token, status: 'cart') do |order|
            order.sub_total = 0
        end
    end

    def add_item(product_id:, quantity:)
        product = Product.find(product_id)

        order_item = order.items.find_or_create_by(
            product_id: product_id
        )
        
        order_item.price = product.price
        # order_item.quantity = quantity
        
        if order_item.quantity > 1
            order_item.quantity += quantity.to_i
        else
            order_item.quantity = quantity.to_i
        end

        ActiveRecord::Base.transaction do
            order_item.save
            update_sub_total!
        end
    end
    
    def remove_item(id:)
        ActiveRecord::Base.transaction do
            order.items.destroy(id)
            update_sub_total!
        end
    end

    def items_count
        order.items.sum(:quantity)
    end

    private
    def update_sub_total!
        order.sub_total = order.items.sum('quantity * price')
        order.save
    end
end