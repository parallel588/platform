class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  attr_accessible :email, :password, :password_confirmation, :logo, :logo_cache, 
                  :name, :occupation, :vat, :address_street, :address_country, :address_city, 
                  :address_zip, :phone_number, :fax_number, :link, :user_type, :buyer_type
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :lockable, :async
         
  mount_uploader :logo, LogoUploader
   
  scope :buyers, -> { where(user_type: :buyer) }
  scope :sellers, -> { where(user_type: :seller) }

  scope :premium, -> { where(seller_type: :premium) }
  scope :free,    -> { where(seller_type: :free) }
  
  

  
  
  
  
  
  
  
  
  
  
  
  
  def name_and_email
    return "#{name} (#{email})"
  end
    
  def is_buyer?
    return user_type == "buyer"
  end       
  
  def is_seller?
    return user_type == "seller"
  end
  
  def is_free_seller?
    return user_type == "buyer" && seller_type == "free"
  end

  def is_premium_seller?
    return user_type == "buyer" && seller_type == "premium"
  end
  
end
