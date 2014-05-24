class RemoveTopBiddingFromAuction < ActiveRecord::Migration
  def change
  	remove_column :auctions, :top_bidding, :string
  end
end
