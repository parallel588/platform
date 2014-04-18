class Product < ActiveRecord::Base
  belongs_to :user
  belongs_to :product_category
  has_many :auctions
  
  attr_protected [nil]
  
  validates :name, presence: true
end
