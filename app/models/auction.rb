class Auction < ActiveRecord::Base
  include AASM
  
  belongs_to :product
  has_many :biddings
  
  # attr_protected [nil]
  
  validates :starting_at, presence: true 
  scope :active, -> { where("ending_at > ? AND status <> ?", Time.now, "finished") }
  
  aasm :skip_validation_on_save => true, :column => 'status' do
    state :active, :initial => true
    state :finished
    state :bought
    state :archived
    
  end
  
  
  
  def active_auctions_cached
    self.active.all    
  end

  
  def refresh_top_bidding!
  	cur_top_bidding = self.biddings.order("value DESC").first.try(:value)
  	self.update_attributes(top_bidding: cur_top_bidding) if (!cur_top_bidding.blank? && cur_top_bidding > self.top_bidding  )
  end
  

  def get_active_bidding_of_user(user)
    user.biddings.where("auction_id = ?", self.id).first    
  end

end
