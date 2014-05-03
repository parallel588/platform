class AuctionsController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_auction_ownership, :only => [:show]


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
    
  
  def show
    @auction = Auction.where("id = ?", params[:id]).includes(:product).first
    @biddings = @auction.biddings
  end
    
  
  def ensure_auction_ownership  
    # TODO
    # Raise excepction and authentication error if the current_user is not the owner of this auction
  end
end