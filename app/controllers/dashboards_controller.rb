class DashboardsController < ApplicationController
  before_action :authenticate_user!

  
  def buyer
    @my_auction_ids = current_user.biddings.select("auction_id").uniq.collect(&:auction_id)    
    @auctions = Auction.find(@my_auction_ids)
  end
  
  
  def seller
    @my_products = current_user.products
  end
  
end
