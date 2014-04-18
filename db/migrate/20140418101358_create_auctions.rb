class CreateAuctions < ActiveRecord::Migration
  def change
    create_table :auctions do |t|
      t.datetime :starting_at
      t.datetime :ending_at
      t.string :status
      t.float :top_bidding
      t.references :product
      
      t.timestamps
    end
    add_index :auctions, :starting_at
    add_index :auctions, :ending_at
    add_index :auctions, :status
  end
end
