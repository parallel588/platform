require 'spec_helper'

describe "ProductAuctions" do
  describe "GET /products" do
    let!(:product_with_auction) { FactoryGirl.create(:product_with_auction) }
    let!(:user) { FactoryGirl.create(:user, {:sign_in_count => 10}) }

    it "displays all products with current active auctions" do      
      visit products_path
      page.should have_content("Place your bidding")
      page.should have_content("#{product_with_auction.product.name}")
    end
    
    it "doesn't allow non signed in buyers to place a bidding" do 
      visit products_path
      click_on "Place your bidding"
      current_path.should == new_user_session_path
    end

    it "allows signed in buyers to place a bidding" do 
      login_as(user, :scope => :user)            
      visit products_path
      click_on "Place your bidding"
      current_path.should == new_auction_bidding_path(product_with_auction)
      page.should have_button("Submit my bidding")
    end
    
    it "displays the products/auctions in pages" do
      
    end
    
    
    it "displays the products/auctions sorted in order if order is changed" do
      
    end
    

    
  end
end
