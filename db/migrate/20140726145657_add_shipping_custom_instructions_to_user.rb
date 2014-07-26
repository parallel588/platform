class AddShippingCustomInstructionsToUser < ActiveRecord::Migration
  def change
    add_column :users, :shipping_custom_instructions, :text
  end
end
