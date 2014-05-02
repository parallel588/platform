class AddBiddingPreferencesToAuction < ActiveRecord::Migration
  def change
    add_column :auctions, :starting_bid, :float
    add_column :auctions, :bid_increment, :float
    add_column :auctions, :buy_out_bid, :float
  end
end
