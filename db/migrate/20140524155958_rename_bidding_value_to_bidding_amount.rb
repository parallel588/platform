class RenameBiddingValueToBiddingAmount < ActiveRecord::Migration
  def change
  	rename_column :biddings, :value, :amount
  end
end
