class RemoveVatFromUser < ActiveRecord::Migration
  def change
  	remove_column :users, :vat
  end
end
