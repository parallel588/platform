class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  attr_accessible :email, :password, :password_confirmation, :logo, :logo_cache, :name, :occupation, :vat, :address_street, :address_country, :address_city, :address_zip, :phone_number, :fax_number, :link
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :lockable, :async
         
  mount_uploader :logo, LogoUploader
         
end
