class BiddingsController < ApplicationController
  before_action :authenticate_user!
			



  def new
  	@auction = Auction.where("id = ?", params[:auction_id]).includes(:product).first
  end


  def create
    @auction = Auction.where("id = ?", params[:auction_id]).includes(:product).first
  	bidding =  Bidding.new( {value: params[:bidding][:value], user: current_user,  auction: @auction,  product: @auction.product} )
  	if bidding.save
  		flash[:notice] = t('biddings.your_bidding_is_successfully_submitted')
  		redirect_to buyer_dashboard_url
  	else  	  
  		redirect_to new_auction_bidding_path(@auction)            
  	end
  end


  def destroy
    @bidding = Bidding.where("id = ?", params[:id]).first
    @bidding.withdraw!
    flash[:notice] = t('biddings.your_bidding_is_succesffully_removed')
		redirect_to buyer_dashboard_url
  end

  
  
  def mark_as_winner
    @auction = Auction.where("id = ?", params[:auction_id]).first
    @bidding = Bidding.where("id = ?", params[:bidding_id]).first
    
    @auction.status = "finished"  
    @bidding.is_winner = true
    if @auction.save  && @bidding.save
      redirect_to seller_dashboard_url
    else
      
    end
  end
end
