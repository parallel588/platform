class AddSellerImagesToSeller < ActiveRecord::Migration
  def change
    add_column :sellers, :seller_logo, :string
    add_column :sellers, :seller_cover, :string
  end
end
