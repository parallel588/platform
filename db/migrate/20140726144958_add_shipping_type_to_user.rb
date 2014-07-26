class AddShippingTypeToUser < ActiveRecord::Migration
  def change
    add_column :users, :shipping_type, :string
  end
end
