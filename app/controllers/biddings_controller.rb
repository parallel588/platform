class BiddingsController < ApplicationController
  before_action :authenticate_user!
  before_action :get_auction, :except => [:destroy]     
  before_action :ensure_user_can_place_bidding!, :only => [:create]			



  def new
  end


  def create
  	bidding =  Bidding.new( {amount: params[:bidding][:amount], user: current_user,  auction: @auction,  product: @auction.product} )
  	if bidding.save
  		flash[:notice] = t('biddings.your_bidding_is_successfully_submitted')
  		redirect_to buyer_dashboard_url
  	else  
      flash[:warning] = bidding.errors[:amount][0]
  		redirect_to new_auction_bidding_path(@auction)            
  	end
  end


  def destroy
    bidding = Bidding.where("id = ?", params[:id]).first
    bidding.make_withdrawn!
    bidding.auction.refresh_top_bidding!
    flash[:notice] = t('biddings.your_bidding_is_succesffully_removed')
		redirect_to buyer_dashboard_url
  end

  
  
  def mark_as_winner
    @bidding = Bidding.where("id = ?", params[:bidding_id]).first    
    @bidding.make_winner!
    redirect_to seller_dashboard_url
  end

  

  private

  def ensure_user_can_place_bidding!
    if !current_user.billings.first.blank? && current_user.billings.first.valid?
      return true
    else
      flash[:warning] = t('user.please_add_billing_infomation')
      redirect_to user_prefernces_path
    end
  end

  def get_auction
    @auction = Auction.where("id = ?", params[:auction_id]).includes(:product).first    
  end

end
