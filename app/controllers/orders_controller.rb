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
      if @new_rating.update_attributes(rating_params)
        @order.update_attribute(:seller_rating_id, @new_rating.id)      
        redirect_to orders_path   
      else
        flash[:alert] = "PROBLEMO"
        redirect_to rate_seller_order_path(@order)
      end      
    end
  end



  def rate_buyer
    @order = Order.find(params[:id])
    @seller = @order.auction.user
    @buyer = @order.user
    @new_rating = Rating.new({:from_user_id => current_user.id, :to_user_id => @buyer.id})

    if params.include?(:rating)  
      if @new_rating.update_attributes(rating_params)
        @order.update_attribute(:buyer_rating_id, @new_rating.id)      
        redirect_to orders_path   
      else
        flash[:alert] = "PROBLEMO"
        redirect_to rate_buyer_order_path(@order)
      end      
    end
  end


  private
  def rating_params
    params.require(:rating).permit(:stars, :review, :rating_id, :auction_id)
  end

end
