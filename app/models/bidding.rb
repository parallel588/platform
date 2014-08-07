class Bidding < ActiveRecord::Base
  include AASM
  
  belongs_to :user
  belongs_to :auction
  belongs_to :product

	
  validate :user, presence: true  
  validate :auction, presence: true  
  validate :product, presence: true  
  validate :amount, presence: true  

  validates_each :amount do |record, attr, value|
    record.errors.add(attr, 'must be greater than the starting bid') if !value.blank? && !record.auction.starting_bid.blank? && value < record.auction.starting_bid    
  end

  validate :bidding_is_greater_than_current


  
  
  after_save :update_auction_winning_bidding
  after_save :finish_auction_if_bought
  after_save :enqueue_new_bidding_notifications

  default_scope { where(status: "active") }
  
  aasm :skip_validation_on_save => true, :column => 'status' do
    state :active, :initial => true
    state :winner
    state :withdraw

    event :make_withdrawn do
      transitions :from => [:active, :winner, :withdraw], :to => :withdraw
    end
    
    event :make_winner do
      after do
        self.auction.awarded!
      end
      before do 
        self.auction.remove_winning_biddings!          
      end      
      transitions :from => [:active, :winner], :to => :winner
    end
  end
    
  

  
  

  def bidding_is_greater_than_current
    unless self.amount >= self.auction.get_current_winning_bidding_value.to_f
      errors.add(:amount, "can't be in the less or same as the current winning ammount")
    end
  end

  
  private

  def update_auction_winning_bidding
    self.auction.refresh_top_bidding!
  end
  

  def finish_auction_if_bought
    if !self.amount.blank? && self.amount.to_f == self.auction.buy_out_bid.to_f
      self.auction.bought!
    end
  end


  def enqueue_new_bidding_notifications
    # TODO 
    # add the tasks for notifications
  end

end
