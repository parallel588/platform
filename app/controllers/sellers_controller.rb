class SellersController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_seller_ownership, :only => [:show]


	
  def edit
  	@seller = Seller.find_by_user_id(current_user.id)
  end


  def update
  	@seller = Seller.find_by_user_id(current_user.id)

  	@seller.update_attributes(seller_params)
  	if @seller.save 
      flash[:notice] = t('user.preferences_successfully_saved')
      redirect_to edit_seller_path(@seller.id)
  	else

  	end
  end


  def ensure_seller_ownership  
    # TODO
    # Raise excepction and authentication error if the current_user is not the owner of this seller

  end


  private
  def seller_params
    params.require(:seller).permit(:description)
  end
end