class Product < ActiveRecord::Base
  belongs_to :user
  belongs_to :product_category
  attr_protected [nil]
  
  validates :name, presence: true
end
