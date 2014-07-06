class Seller < ActiveRecord::Base
  belongs_to :user

  mount_uploader :seller_logo, SellerLogoUploader
  mount_uploader :seller_cover, SellerCoverUploader
  
  
end
