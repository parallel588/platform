class Product < ActiveRecord::Base
  belongs_to :user
  belongs_to :product_category
  has_many :auctions
  
  # attr_protected [nil]
  
  validates :name, presence: true
  
  accepts_nested_attributes_for :auctions, :allow_destroy => true
  # attr_accessible :auctions_attributes
  
  
  def current_auction_cached
    # Returns an auction resource
    # Each product can have  many auctions - The current auction is the last one active
    # Todo - Add the Cache fetch / push / invalidate part
    self.products.auctions.not_expired.last
  end
  
  def active_auction
    return self.auctions.order("created_at DESC").first
  end


  def to_s
    return "#{self.volume} #{self.name} from #{self.country}"    
  end
end
