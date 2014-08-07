class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_filter :set_locale
  before_filter :store_location # Note that if you happen to have before_filter :authenticate_user! in your ApplicationController you will need to use before_filter 

  
  
  
  
  
  
  # ################## START of Overriding DEVISE ################## #
  def store_location
    if !(request.fullpath =~ Regexp.union("/login_register", "/login", "/logout", "signup", "reset_password")) && !request.xhr?
      session[:previous_url] = request.fullpath 
    else      
      session[:previous_url] = nil
    end
  end
  

  def after_sign_in_path_for(user)
    # TODO - define the policy of redirections after signing in and how we track the converted members from the

    # CASE #1 -  If the policy is that we want a specific URL to identify the NEW SIGNUPS and the RETURNING VISITORS 
    # We can do the following
    # if user.sign_in_count == 1
    #   return welcome_new_user_path
    # else
    #   return welcome_back_existing_user_path
    # end      
    
    # If the policy is that we want the user to be redirected back to the url that he requested before being asked to login/signup
    sign_in_url = url_for(:action => 'new', :controller => 'sessions', :only_path => false, :protocol => 'http')
    if request.referer == sign_in_url || request.referer.to_s.include?("login_register")
      super
    else
      stored_location_for(user) || request.referer || home_without_locale_path
    end
  end
  
  
  def after_sign_out_path_for(user)
    super
  end
  
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << [:logo, :logo_cache, :name, :occupation, :address_street, :address_country, :address_city, :address_zip, :phone_number, :fax_number, :link]
  end
  # ################## End of Overriding DEVISE ################## #
  
  
  
  # ################## START of CAN CAN - Authentication ################## #
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end
  # ################## END of CAN CAN - Authentication ################## #
  
  
  def set_locale
    params[:locale] ||= cookies[:locale] unless session[:locale].blank?
    params[:locale] ||= :en
    I18n.locale = params[:locale].to_sym   
    cookies[:locale] = I18n.locale.to_s unless cookies[:locale] == I18n.locale.to_s
  end
  
  
  def default_url_options(options={})
    {locale: I18n.locale}
  end 
  
end
