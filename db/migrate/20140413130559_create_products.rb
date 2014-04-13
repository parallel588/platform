class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.string :type
      t.string :subtype
      t.string :country
      t.string :volume
      t.string :size
      t.string :quality
      t.float :bidding
      t.datetime :ending_at
      t.datetime :delivery_at
      t.text :shipping_information
      t.text :packaging_information
      t.string :pallets
      t.datetime :starting_at

      t.timestamps
    end
    
    add_index :products, :name
    add_index :products, :type
    add_index :products, :subtype
    add_index :products, :country
    add_index :products, :ending_at
    add_index :products, :delivery_at
  end
end
