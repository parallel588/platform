class UsersController < ApplicationController
  before_action :authenticate_user!
  
  
  def edit
    @user = current_user
  end
  
  
  def update
    # Rekect the password values when the password is not on change
    if params[:user][:password].blank? && params[:user][:password_confirmation].blank?
        params[:user].delete(:password)
        params[:user].delete(:password_confirmation)
    end
    
    @user = current_user
    @user.update_attributes(params[:user])
    
    if @user.save!
      flash[:notice] = t('user.preferences_successfully_saved')
      redirect_to "/"
    else
      flash[:alert] = t('user.preferences_not_saved')
      redirect_to user_prefernces_path
    end
  end
  
end
