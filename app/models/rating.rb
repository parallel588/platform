class Rating < ActiveRecord::Base

  belongs_to :auction


  after_create :update_user_rating_average
  
  validates :auction, presence: true
  validates :auction_id, presence: true
  validates :stars, presence: true

  def reviewer
    return User.find_by_id(self.from_user_id) || nil
  end


  def reviewed
    return User.find_by_id(self.from_user_id) || nil
  end


  def update_user_rating_average
    user_ratings = Rating.where("to_user_id = ?", self.to_user_id)
    new_rating_average = user_ratings.sum(:stars) / user_ratings.count
    User.find_by_id(self.to_user_id).update_attribute("rating_average", new_rating_average)
  end

end