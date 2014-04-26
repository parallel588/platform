class AddStatusToBidding < ActiveRecord::Migration
  def change
    add_column :biddings, :status, :string, :default => "active"

    add_index :biddings, :status
  end
end
