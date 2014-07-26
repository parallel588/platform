class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.integer :auction_id
      t.integer :product_id
      t.integer :bidding_id
      t.integer :assignee_id
      t.string :assignee_email
      t.string :status
      t.integer :zendesk_ticket_id

      t.timestamps
    end
  end
end
