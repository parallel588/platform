class ProductImage < ActiveRecord::Base
  belongs_to :product

  mount_uploader :file, ProductImageUploader
  delegate :url, to: :file
end
