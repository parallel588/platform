class Bidding < ActiveRecord::Base
  belongs_to :user
  belongs_to :auction
  belongs_to :product

	
  validate :user, presence: true  
  validate :auction, presence: true  
  validate :product, presence: true  
  validate :value, presence: true  

  validates_each :value do |record, attr, value|
    record.errors.add(attr, 'must be greater than the starting bid') if !value.blank? && !record.auction.starting_bid.blank? && value < record.auction.starting_bid
  end
  
  
  
  after_save :update_auctions_top_bidding
  after_save :finish_auction_if_bought
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
    if !self.value.blank?  && self.value.to_f > self.auction.top_bidding.to_f
      auction.update_attributes!(top_bidding: self.value)
    end
  end
  
  def finish_auction_if_bought
    if !self.value.blank? && self.value.to_f == self.auction.buy_out_bid.to_f
      self.auction.update_attribute(:status, "finished")
      # TODO      # Add other consequences of an auction finsihed by a buy out!      
    end
  end



  def enqueue_bidders_notifications
    # TODO 
    # add the tasks for notifications
  end

end
