class AddWinningBuyerUserIdToAuction < ActiveRecord::Migration
  def change
    add_column :auctions, :winning_buyer_id, :integer
    add_index :auctions, :winning_buyer_id
  end
end
