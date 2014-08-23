class HomeController < ApplicationController
  
  def index
    @home_layout = true
    @produts_auctions_ending_today = Product.where(id: Auction.active.ending_today.limit(6).collect(&:product_id))
    @latest_added_products = Product.order("created_at desc").limit(6)    
    # @latest_added_products_excluding_last_minute =  Product.where(id: Auction.active.ending_later_than_today.limit(6).collect(&:product_id)).order("created_at desc")
  end
  
  
  def welcome
    
  end
  
end
