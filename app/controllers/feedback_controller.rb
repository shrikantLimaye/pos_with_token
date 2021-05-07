class FeedbackController < ApplicationController


    def new
        @feedback  = Feedback.new
    end

    def show
        @feedbacks = Feedback.all
    end

    def create
        # render plain: feedback_params.inspect
        
        @feedback = @order.feedbacks.new(feedback_params)
        @feedback.save
        redirect_to cart_list_path
    end

    private
    def feedback_params
        params.require(:feedbacks).permit(:title, :description, :order_id)
    end
end
