class ProductCategory < ActiveRecord::Base
  has_many :products
  has_ancestry
  
  # attr_protected [nil]
  
  validates :name, presence: true
  
  
end
