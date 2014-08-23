class CheckoutsController < ApplicationController
  before_action :authenticate_user!
  before_action :define_order, :except => [:cart]
  layout "checkout"

  def cart
      
  end

  
  def billing
    @current_step = 1
    @billing = Billing.find_or_create_by(user_id: current_user.id)

  end

  
  def shipping
    @current_step = 2
  end


  def confirm
    @current_step = 3
  end


  def thankyou
    @current_step = 4
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
