class Billing < ActiveRecord::Base
	belongs_to :user

  validates :card_number, presence: true
  validates :expiration_date, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :address_line_1, presence: true
  validates :city, presence: true
  validates :postal_code, presence: true
  validates :country, presence: true
  


  def address_summary
    return "#{self.address_line_1} #{self.address_line_2} #{self.city} #{self.postal_code} #{self.country}"
  end
  
end
