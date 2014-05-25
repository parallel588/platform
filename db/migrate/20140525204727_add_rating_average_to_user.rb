class AddRatingAverageToUser < ActiveRecord::Migration
  def change
    add_column :users, :rating_average, :float
    add_index :users, :rating_average
  end
end
