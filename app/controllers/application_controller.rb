class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  
  
  
  
  
  
  
  
  
  # ################## START of Overriding DEVISE ################## #
  def after_sign_in_path_for(user)
    if user.sign_in_count == 1
      return welcome_new_user_path
    else
      return welcome_back_existing_user_path
    end      
  end
  
  def after_sign_out_path_for(user)
    super
  end
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << [:logo, :logo_cache, :name, :occupation, :vat, :address_street, :address_country, :address_city, :address_zip, :phone_number, :fax_number, :link]
  end
  # ################## End of Overriding DEVISE ################## #
  
  
  
  # ################## START of CAN CAN - Authentication ################## #
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end
  # ################## END of CAN CAN - Authentication ################## #
  
  
end
