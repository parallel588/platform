class Product < ActiveRecord::Base
  belongs_to :user
  attr_protected [nil]
end
