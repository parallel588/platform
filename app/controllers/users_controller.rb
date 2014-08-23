class UsersController < ApplicationController
  before_action :authenticate_user!

  
  
  def edit
    @current_settings_page = "personal"
    @user = current_user
  end
  
  
  def update
    # Reject the password values when the password is not on change
    if params[:user][:password].blank? && params[:user][:password_confirmation].blank?
        params[:user].delete(:password)
        params[:user].delete(:password_confirmation)
    end  
    @user = current_user
    @user.update_attributes(user_params)    
    
    if @user.save
      flash[:notice] = t('user.preferences_successfully_saved')
      redirect_to "/"
    else
      flash[:alert] = t('user.preferences_not_saved')
      redirect_to user_prefernces_path
    end
  end
  
  
  def show
    @user = User.find(params[:id])    
    if @user.user_type == "seller"
      @seller_ratings = Rating.where("to_user_id = ?", @user.id).order("created_at DESC").limit(10)
      render "seller"
    else
      render "buyer"
    end
    
  end


  def billing
    @current_settings_page = "billing"
    @billing = Billing.find_or_create_by(user_id: current_user.id)
    if params.include?(:billing)
      if @billing.update_attributes(billing_params)
        flash[:notice] = t('user.billing_preferences_successfully_saved')
      else
        flash[:alert] = t('user.billing_preferences_could_not_be_saved')
      end
    end
    # Decide wether we are in a continuous checkout process or in a user preferences page.
    if params.include?(:order_id)
      redirect_to shipping_order_path(Order.find(params[:order_id]))
    else
      render "users/billings/edit"
    end
    
  end


  def shipping
    @current_settings_page = "shipping"
    if params.include?(:user)
      if current_user.update_attributes(shipping_params)
        flash[:notice] = t('user.shipping_preferences_successfully_saved')
      else
        flash[:alert] = t('user.shipping_preferences_could_not_be_saved')
      end
    end
    if params.include?(:order_id)
      redirect_to confirm_order_path(Order.find(params[:order_id]))
    else
      render "users/shippings/edit"    
    end
  end
  
  
  def index
    # resources :users do
    #   collection do
    #     get :all, :controller => "users", :action => "index", :filter => "all"
    #     get :buyers, :controller => "users", :action => "index", :filter => "buyers"
    #     get :sellers, :controller => "users", :action => "index", :filter => "sellers"
    #   end
    # end
    redirect_to all_users_path unless ["all", "buyers", "sellers"].include?(params[:filter])
    
    @users = User.send(params[:filter]).page params[:page] 
  end
  
  
  
  private 
  
  def shipping_params
    params.require(:user).permit(:shipping_type, :address_street, :address_country, :address_city, :address_zip, :shipping_custom_instructions)
  end

  def billing_params
    params.require(:billing).permit(Billing.attribute_names.map(&:to_sym))
  end


  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :logo, :logo_cache, :name, :occupation, :vat, :address_street, :address_country, :address_city, :address_zip, :phone_number, :fax_number, :link, :user_type, :buyer_type)
  end
  
  
end
