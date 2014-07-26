class RatingsController < ApplicationController
	before_action :authenticate_user!


	def update
		
	end


	def create
		rating = Rating.new({
			:to_user_id => params[:user_id], 
			:from_user_id => current_user.id, 
		})
		rating.update_attributes(rating_params)
		if rating.save
			flash[:notice] = t('rating.rating_successfully_saved')
			redirect_to user_ratings_path(params[:user_id])
		else
      flash[:alert] = t('rating.your_rating_could_not_be_saved')			
			redirect_to user_ratings_path(params[:user_id])
		end
	end


  def index
  	@reviewed_user = User.where("id = ?", params[:user_id]).first
    @ratings = Rating.where("to_user_id = ?", params[:user_id])
    @reviewed_user_possible_auctions = Auction.where(:winning_buyer_id => current_user.id, :seller_id => @reviewed_user.id)
    @new_rating = Rating.new({:from_user_id => current_user.id, :to_user_id => params[:user_id]})
  end



  private
  def rating_params
  	params.require(:rating).permit(:stars, :review, :rating_id, :auction_id)
  end

end