class OrdersController < ApplicationController
  before_action :authenticate_user!


  def index
    # This is a test action to help display all order
    # TODO update this  or remove
    @orders = Order.all
  end


  def rating
    @order = Order.find(params[:id])
    
  end

end
