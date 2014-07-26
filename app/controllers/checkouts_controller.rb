class CheckoutsController < ApplicationController
  before_action :authenticate_user!
  before_action :define_order, :except => [:cart]


  def cart
      
  end

  
  def billing
    @billing = Billing.find_or_create_by(user_id: current_user.id)

  end

  
  def shipping
    
  end


  def confirm
        
  end


  def place
    # ZENDESK CONNECTION HERE
    @order.confirm!
    redirect_to thankyou_order_path(@order)
  end


  private


  def define_order
    @order = Order.find(params[:id])
  end
end
