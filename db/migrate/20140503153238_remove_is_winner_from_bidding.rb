class RemoveIsWinnerFromBidding < ActiveRecord::Migration
  def change
    remove_column :biddings, :is_winner
  end
end
