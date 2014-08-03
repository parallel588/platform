class Notification < ActiveRecord::Base

  # type: [auction_awarded, auction_lost, ]
  # medium: [web, email, sms, push]


  belongs_to :user
  belongs_to :auction






  # constructors

  # When a buyer makes a new bidding
  def self.enqueue_new_bidding_notifications(auction_id, previous_winning_bidding_id, current_winning_bidding_id)
    # Enqueue an email to the latest winner / buyer
    AuctionMailer.inform_winner_for_new_bidding(auction_id, previous_winning_bidding_id, current_winning_bidding_id).deliver
    AuctionMailer.inform_loser_for_bidding(auction_id, previous_winning_bidding_id, current_winning_bidding_id).deliver
    AuctionMailer.inform_auction_seller_for_new_bidding(auction_id, previous_winning_bidding_id, current_winning_bidding_id).deliver
  end


  # When a buyer is awarded with a new auction
  def self.enqueue_auction_finished_notifications(auction_id)
    AuctionMailer.inform_awarded_winner()    
  end

  
  # When a new rating is submitted.
  def self.enqueue_new_rating_notification(rating_id)
    
  end


end
