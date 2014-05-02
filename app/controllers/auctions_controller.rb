class AuctionsController < ApplicationController
  before_action :authenticate_user!


  def buy_now
    @auction = Auction.where("id = ?", params[:id]).includes(:product).first
	  bidding =  Bidding.new( {value: @auction.buy_out_bid, user: current_user,  auction: @auction,  product: @auction.product} )
	  if bidding.save
		  flash[:notice] = t('biddings.the_product_is_yours')
		  redirect_to buyer_dashboard_url
	  else  	  
		  redirect_to new_auction_bidding_path(@auction)            
	  end
  end

end