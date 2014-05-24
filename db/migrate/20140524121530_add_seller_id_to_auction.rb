class AddSellerIdToAuction < ActiveRecord::Migration
  def change
	add_column :auctions, :seller_id, :integer
    add_index :auctions, :seller_id  	
  end
end
