class Product < ActiveRecord::Base
  belongs_to :user
  belongs_to :product_category
  has_many :auctions
  has_many :product_images
  has_one :product_image

  # attr_protected [nil]

  validates :name, presence: true

  accepts_nested_attributes_for :auctions, allow_destroy: true
  accepts_nested_attributes_for :product_images, allow_destroy: true
  # attr_accessible :auctions_attributes


  def current_auction_cached
    # Returns an auction resource
    # Each product can have  many auctions - The current auction is the last one active
    # Todo - Add the Cache fetch / push / invalidate part
    self.auctions.not_expired.last
  end

  def active_auction
    return self.auctions.order("created_at DESC").first
  end


  def relevant_products(limit)
    self.product_category.products.where("id <> ?", self.id).limit(limit) unless self.product_category.blank?
  end


  def to_s
    return "#{self.volume} #{self.name} from #{self.country}"
  end
end
