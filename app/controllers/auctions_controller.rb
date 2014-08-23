class AuctionsController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_auction_ownership, :only => [:show]


  def buy_now
    @auction = Auction.where("id = ?", params[:id]).includes(:product).first
	  bidding =  Bidding.new( {amount: @auction.buy_out_bid, user: current_user,  auction: @auction,  product: @auction.product} )
	  if bidding.save
		  flash[:notice] = t('biddings.the_product_is_yours')
      @order = Order.create(
        :auction => @auction,
        :bidding => bidding,
        :user    => current_user
      )
      if @order.blank?
        flash[:warning]  = t('biddings.something_went_wrong_and_we_havenot_received_your_order')
        redirect_to product_url(@auction.product)            
      else
        redirect_to billing_order_path(@order)
      end
	  else  	 
      flash[:warning]  = t('biddings.amount_of_bidding_cannot_be_less_than_the_current_winning_bidding')
		  redirect_to product_url(@auction.product)            
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