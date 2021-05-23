class FeedbacksController < ApplicationController
    before_action :set_feedback, only: [:show]

    def index
        @feedbacks = Feedback.all
    end

    def new
        @feedback  =  Feedback.new
        
        @orders = Order.all
        # @order = Order.find(params[:order_id])
    end

    def show
        
    end

    def create
        # order = Order.find(feedback_params[:order_id])
        # @feedback = order.feedbacks.build(feedback_params)
        @order = Order.find(params[:order_id])
        @feedback = @order.feedbacks.build(feedback_params)


        if @feedback.save!
            flash[:notice] = "Feedback has been saved!!"
            # redirect_to cart_show_orderitems_path(@feedback.order_id)/
            redirect_to cart_list_path
        else
            @order = Order.find(params[:order_id])
            flash[:notice] = 'I was not able to save the feedback!'
            render cart_show_orderitems_path
            # byebug
            # Show the errors on page in an error block
            # notices / alerts / flash
        end
    end

    private

    def set_feedback
        @feedback = Feedback.find(params[:id])
    end

    def feedback_params
        params.require(:feedbacks).permit(:title, :description, :order_id)
    end
end
