require 'spec_helper'

describe "SellerDashboard" do
  describe "GET /dashboard/seller" do    
    let(:user) {  FactoryGirl.create(:user) }
    let(:product) { FactoryGirl.create(:product, {user: user}) }
    
    it "fetches the user's products" do
      login_as(user, :scope => :user)            
      
      product.user = user
      visit seller_dashboard_url
      
      page.should have_content("#{product.name}")
      page.should have_content("#{product.product_category.name}")
    end
  end
end
