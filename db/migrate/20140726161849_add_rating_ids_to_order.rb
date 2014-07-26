class AddRatingIdsToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :buyer_rating_id, :integer
    add_index :orders, :buyer_rating_id
    add_column :orders, :seller_rating_id, :integer
    add_index :orders, :seller_rating_id
  end
end
