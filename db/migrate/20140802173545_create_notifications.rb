class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.integer :user_id
      t.string :title
      t.text :body
      t.string :type
      t.string :status
      t.string :link
      t.integer :auction_id

      t.timestamps
    end
    add_index :notifications, :user_id
    add_index :notifications, :type
    add_index :notifications, :status
    add_index :notifications, :auction_id
  end
end
