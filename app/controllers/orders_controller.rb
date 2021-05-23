class OrdersController < ApplicationController

    def list
        @orders = Order.all
    end

    def new
        @order = current_cart.order
    end

    def create
        @order = current_cart.order

        if @order.update(order_params.merge(status: 'paid'))
            session[:cart_token] = nil

            redirect_to product_mainpage_path
        else
            render :action => 'new'
        end
    end

    # def start_timer
    #     m = 20
    #     e = Time.now + m.to_i*60
    #     @timer

    #     loop do
            
    #         t = e - Time.now
    #         break if t < 0

    #         sleep 1

    #         min, sec = t/60, t%60
    #         # print "\b"*5
    #         # printf "%02d:%02d", min, sec if t > 0
    #         @timer = "%02d:%02d", min, sec if t > 0
    #     end
    # end

    def show_orderitems
        
        @order = Order.find(params[:id])
        # @feedback  =  Feedback.new
         @feedbacks = @order.feedbacks
    end

    def customer_feedback
    
        @order = Order.find(params[:order_id])

        if @order == true
            render  "orders/customer_feedback"
        end
        render ('orders/404new')
        # @order = Order.find(params[:order_id])
        
                
    end
   
    

    private

    def order_params
        params.require(:order).permit(:first_name, :last_name, :order_id)
    end

end