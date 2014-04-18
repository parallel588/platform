class Product < ActiveRecord::Base
  belongs_to :user
  belongs_to :product_category
  has_many :auctions
  
  # attr_protected [nil]
  
  validates :name, presence: true
  
  accepts_nested_attributes_for :auctions, :allow_destroy => true
  # attr_accessible :auctions_attributes
end
