class Auction < ActiveRecord::Base
  belongs_to :product
  attr_protected [nil]
  
  validates :starting_at, presence: true
end
