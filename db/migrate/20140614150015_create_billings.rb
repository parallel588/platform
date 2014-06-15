class CreateBillings < ActiveRecord::Migration
  def change
    create_table :billings do |t|
      t.string  :card_number
      t.date    :expiration_date
      t.string  :first_name
      t.string  :last_name
      t.string  :address_line_1
      t.string  :address_line_2
      t.string  :city
      t.string  :state
      t.string  :postal_code
      t.string  :country
      t.string  :vat_number
      t.integer :user_id

      t.timestamps
    end
    add_index :billings, :user_id
  end
end
