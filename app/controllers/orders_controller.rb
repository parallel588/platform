class OrdersController < ApplicationController
  before_action :authenticate_user!


  def index
    # This is a test action to help display all order
    # TODO update this  or remove
    @orders = Order.all
  end

  # TODO
  # REMOVE CODE DUPLICATION IN THIS CONTROLLER

  def rate_seller
    @order = Order.find(params[:id])
    @seller = @order.auction.user
    @buyer = @order.user
    @new_rating = Rating.new({:from_user_id => current_user.id, :to_user_id => @seller.id})
    
    if params.include?(:rating)  
      
    else

    end
  end



  def rate_buyer
    @order = Order.find(params[:id])
    @seller = @order.auction.user
    @buyer = @order.user
    @new_rating = Rating.new({:from_user_id => current_user.id, :to_user_id => @buyer.id})

    if params.include?(:rating)  

    else

    end
  end

end
