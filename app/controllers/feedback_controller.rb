class FeedbackController < ApplicationController


    def new
        @feedback  =  @order.Feedback.new
        @order = Order.all
    end

    def show
        @feedbacks = Feedback.all
    end

    def create
        # render plain: feedback_params.inspect
        @order = Order.find(params[:order_id])
        render plain: @order.inspect
        @feedback = @order.feedback(feedback_params)
        @feedback.save
        redirect_to cart_list_path
    end

    private
    def feedback_params
        params.require(:feedbacks).permit(:title, :description, :order_id)
    end
end
