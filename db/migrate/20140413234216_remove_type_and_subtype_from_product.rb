class RemoveTypeAndSubtypeFromProduct < ActiveRecord::Migration
  def change
    remove_column :products, :type    
    remove_column :products, :subtype    
  end
end
