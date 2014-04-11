class AddSellerTypeToUser < ActiveRecord::Migration
  def change
    add_column :users, :buyer_type, :string, :default => :free
  end
end
