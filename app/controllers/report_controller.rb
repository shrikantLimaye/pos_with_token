class ReportController < ApplicationController
  def index
    @orders = Order.all
    
    @data = Order.group(:sub_total).count
   
  end
end
