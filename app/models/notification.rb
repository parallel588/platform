class Notification < ActiveRecord::Base

  # type: [auction_awarded, auction_lost, ]
  # medium: [web, email, sms, push]


  belongs_to :user
  belongs_to :auction






  # constructors

  # When a buyer makes a new bidding
  def self.enqueue_new_bidding_notifications(auction_id)
      
  end


  # When a buyer is awarded with a new auction
  def self.enqueue_auction_finished_notifications(auction_id)
    
  end

  
  # When a new rating is submitted.
  def self.enqueue_new_rating_notification(rating_id)
    
  end


end
