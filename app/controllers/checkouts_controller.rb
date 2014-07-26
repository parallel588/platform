class CheckoutsController < ApplicationController
  before_action :authenticate_user!


  def cart
      
  end

  
  def billing
    @billing = Billing.find_or_create_by(user_id: current_user.id)

  end

  
  def shipping
    
  end



  private

end
