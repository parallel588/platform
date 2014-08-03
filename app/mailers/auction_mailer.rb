class AuctionMailer < ActionMailer::Base
  default from: "notifications@basketo.co"



  def inform_auction_seller_for_new_bidding(auction_id, previous_winning_bidding_id, current_winning_bidding_id)
    @winning_bidding = Bidding.find(current_winning_bidding_id)
    @ex_winning_byer = User.find(Bidding.find(previous_winning_bidding_id).user.id)
    @current_winning_byer = User.find(@winning_bidding.user.id)
    @auction = Auction.find(auction_id)  
    @product @auction.product  
    @seller = @auction.product.user

    mail( to: @seller.email, 
          subject: "A new winning bidding your auction #{@auction.id} for product #{@product.name}", 
    )
  end


  def inform_awarded_winner(auction_id)
    @auction = Auction.find(auction_id)
    @product =@auction.product
    @winner_buyer = Bidding.find(winning_bidding_id).user
    mail (
      to: @winner_buyer.email,
      subject: "Congratulations! You are officially the winner of the auction #{auction.id} for the product #{@product.name}"
    )
  end


  def inform_loser_for_new_bidding()


  end


  def inform_winner_for_new_bidding()
    
  end


end
