class AddAuctionIdToRating < ActiveRecord::Migration
  def change
    add_column :ratings, :auction_id, :integer
    add_index  :ratings, :auction_id
  end
end
