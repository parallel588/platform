class Rating < ActiveRecord::Base

  after_create :update_user_rating_average



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