class Auction < ActiveRecord::Base
  include AASM
  
  belongs_to :product
  belongs_to :user, foreign_key: :seller_id
  has_many :biddings
  
  # attr_protected [nil]
  
  validates :starting_at, presence: true 
  scope :active, -> { where("ending_at > ? AND (status <> ? OR status IS NULL)", Time.now, "finished") }
  
  aasm :skip_validation_on_save => true, :column => 'status' do
    state :active, :initial => true
    state :finished
    state :bought
    state :archived    
    
    event :awarded! do
      transitions :from => [:finished, :active], :to => :finished      
      after do
        # TODO
        # Notifications
      end
    end

    event :bought! do
      transitions :from => [:finished, :active], :to => :bought          
    end

    event :time_out! do
      transitions :from => [:finished, :active], :to => :finished      
      after do
        # TODO
        # Notifications
      end
    end
   
  end  
  

  def get_current_winning_bidding_value
    # TODO - CACHE this
    return begin
      Bidding.find(winning_bidding_id).try(:amount)
    rescue Exception => e
      self.starting_bid  
    end
  end
  
  def active_auctions_cached
    self.active.all    
  end
  

  def remove_winning_biddings!
    Bidding.where("auction_id = ?", self.id).update_all :status => "active"          
  end


  def get_winning_bidding_obj
    return begin
      Bidding.find(winning_bidding_id)
    rescue Exception => e
      nil
    end
  end

  
  def refresh_top_bidding!
    # TODO 
    # Refactor this
    self.reload
    Bidding.reset_column_information
  	real_top_bidding_obj = self.biddings.order("amount DESC").first # Gets the latest ACTIVE bidding

    if self.winning_bidding_id.blank? || Bidding.where("id = ?", self.winning_bidding_id).blank?
      # NO previous winning bidding or the previous winning bidding is the exact same that it gets now withdrawn
      self.update_attributes(:winning_bidding_id => real_top_bidding_obj.id) 
      self.update_attributes(:winning_buyer_id => real_top_bidding_obj.user.id)
    elsif 
      # YES previous winning bidding exists - compare to be safe
      if real_top_bidding_obj.amount > Bidding.find(self.winning_bidding_id).amount
        self.update_attributes(:winning_bidding_id => real_top_bidding_obj.id) 
        self.update_attributes(:winning_buyer_id => real_top_bidding_obj.user.id)
      end
    end

  end
  

  def get_active_bidding_of_user(user)
    user.biddings.where("auction_id = ?", self.id).order("amount DESC").first    
  end

end
