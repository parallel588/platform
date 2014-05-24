class AddWinningBiddingIdToAuction < ActiveRecord::Migration
  def change
    add_column :auctions, :winning_bidding_id, :integer
    add_index :auctions, :winning_bidding_id
  end
end
