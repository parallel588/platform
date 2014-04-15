require 'spec_helper'

describe "Products" do
  describe "GET /user/:user_id/products" do    
    let(:user) {  FactoryGirl.create(:user) }
    let(:product) { FactoryGirl.create(:product, {user: user}) }
    
    it "fetches the user's products" do
      login_as(user, :scope => :user)            
      
      product.user = user
      visit user_products_path(:user_id => user.id)
      
      save_and_open_page
    end
  end
end
