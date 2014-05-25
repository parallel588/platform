class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.integer :from_user_id
      t.integer :to_user_id
      t.float :stars
      t.text :review

      t.timestamps
    end
    
    add_index :ratings, :from_user_id
    add_index :ratings, :to_user_id
    add_index :ratings, :stars
  end
end
