class BiddingsController < ApplicationController
  before_action :authenticate_user!
			



  def new
  	@auction = Auction.where("id = ?", params[:auction_id]).includes(:product).first
  end


  def create
    @auction = Auction.where("id = ?", params[:auction_id]).includes(:product).first
  	if Bidding.create!( {value: params[:value], user: current_user,  auction: @auction,  product: @auction.product} )
  		flash[:notice] = t('biddings.your_bidding_is_successfully_submitted')
  		redirect_to bidding_submitted_auction_path(@auction)
  	else
  		render "new"
  	end
  end


  def destroy
    @bidding = Bidding.where("id = ?", params[:id]).first
    @bidding.withdraw!
    flash[:notice] = t('biddings.your_bidding_is_succesffully_removed')
    redirect_to bidding_removed_auction_path(id: @bidding.auction.id)
  end


end
