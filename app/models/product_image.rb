class ProductImage < ActiveRecord::Base
  belongs_to :product

  mount_uploader :file, ProductImageUploader
  delegate :url, to: :file

  attr_accessor :crop_x, :crop_y, :crop_w, :crop_h

  def crop!(x, y, w, h)
    @crop_x = x
    @crop_y = y
    @crop_w = w
    @crop_h = h
    file.recreate_versions!(:square)
  end
end
