class CreateBiddings < ActiveRecord::Migration
  def change
    create_table :biddings do |t|
      t.float :value
      t.references :user, index: true
      t.references :auction, index: true
      t.references :product, index: true
      t.boolean :is_winner

      t.timestamps
    end
  end
end
