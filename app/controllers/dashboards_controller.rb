class DashboardsController < ApplicationController
  before_action :authenticate_user!

  
  def buyer
    @my_biddings = current_user.biddings.limit(10).order("created_at DESC")
  end
  
  
  def seller
    
  end
  
end
