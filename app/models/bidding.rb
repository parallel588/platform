class Bidding < ActiveRecord::Base
  belongs_to :user
  belongs_to :auction
  belongs_to :product

	
  validate :user, presence: true  
  validate :auction, presence: true  
  validate :product, presence: true  
  validate :value, presence: true  

  validate :value, with: :validates_bidding_is_greater_than_current_top_bidding

  after_save :update_auctions_top_bidding
  after_save :enqueue_bidders_notifications

  default_scope { where(status: "active") }



  
  
  def withdraw!
    self.update_attributes(:status => "withdraw")    
    self.auction.refresh_top_bidding!
    # TODO update the auction top_bidding.
    # Notify auction bidders for the change.

  end


  private
  def validates_bidding_is_greater_than_current_top_bidding
  	return self.value > self.auction.top_bidding	
  end
  

  def update_auctions_top_bidding
    auction.update_attributes!(top_bidding: self.value) unless (!auction.top_bidding.blank? && self.value < auction.top_bidding)
  end

  def enqueue_bidders_notifications
    # TODO 
    # add the tasks for notifications
  end

end
