class AddThreeDigitToBilling < ActiveRecord::Migration
  def change
    add_column :billings, :three_digit, :integer
  end
end
