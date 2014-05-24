class CreateSellers < ActiveRecord::Migration
  def change
    create_table :sellers do |t|
      t.integer :user_id
      t.text :description

      t.timestamps
    end
    add_index :sellers, :user_id
  end
end
