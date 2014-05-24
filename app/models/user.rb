class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  # attr_accessible :email, :password, :password_confirmation, :logo, :logo_cache, 
  #                 :name, :occupation, :vat, :address_street, :address_country, :address_city, 
  #                 :address_zip, :phone_number, :fax_number, :link, :user_type, :buyer_type

  # attr_protected [nil]
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :lockable, :async
         
  mount_uploader :logo, LogoUploader
   
  scope :buyers, -> { where(user_type: :buyer) }
  scope :sellers, -> { where(user_type: :seller) }

  scope :premium, -> { where(seller_type: :premium) }
  scope :free,    -> { where(seller_type: :free) }
  
  paginates_per 2
  
  has_many :products # as a seller
  has_many :auctions,foreign_key: :seller_id # as a seller
  has_many :biddings # as a buyer

  after_create :build_seller_object
  
  
  
  
  
  
  
  
  
  
  def build_seller_object
    # Call this only when a Seller user is created and not in every case of new user!
    # It depends on the UI / How the form will look or if we will have separate forms for the 2 user types.
    Seller.create({:user_id => self.id})  
  end
  

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
