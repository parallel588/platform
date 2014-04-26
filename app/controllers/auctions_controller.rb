class AuctionsController < ApplicationController
  before_action :authenticate_user!


  def bidding_submitted
    @auction = Auction.where("id = ?", params[:id]).includes(:product).first
    @bidding = current_user.biddings.where(auction: @auction).first
  end

end