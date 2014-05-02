require 'spec_helper'

describe "Biddings" do
  describe "GET /auctions/:id/bidding/new" do    
    let!(:product_with_auction) { FactoryGirl.create(:product_with_auction) }
    let!(:user) { FactoryGirl.create(:user, {:sign_in_count => 10}) }

    it "allows new biddings to be placed from logged in buyers" do 
      login_as(user, :scope => :user)            
      visit new_auction_bidding_path(product_with_auction)            
      page.should have_button("Submit my bidding")      
    end
        
      
  end
  
  
  describe  "POST /auctions/:id/bidding" do
    let!(:product_with_auction) { FactoryGirl.create(:product_with_auction) }
    let!(:user) { FactoryGirl.create(:user, {:sign_in_count => 10}) }
    let!(:bidding) {FactoryGirl.create(:bidding, auction: product_with_auction, user: user, product: product_with_auction.product )}

    it "properly allows user to do the very first bidding" do
      login_as(user, :scope => :user)            
      visit new_auction_bidding_path(product_with_auction)  
      fill_in "My Bid", :with => 10.0 
      click_on "Submit my bidding"
      current_path.should == buyer_dashboard_path
      product_with_auction.top_bidding = 10.0
    end

    

    it "prompts if the bidding is not sufficiently bigger than the starting bidding of this auction" do 
      expensive_product_with_auction = FactoryGirl.create(:product_with_auction, :starting_bid => 10)      
      login_as(user, :scope => :user)            
      visit new_auction_bidding_path(expensive_product_with_auction)  
      fill_in "My Bid", :with => 5
      click_on "Submit my bidding"
      current_path.should == new_auction_bidding_path(expensive_product_with_auction)  
    end
    
    
    it "prompts if the bidding is not sufficiently bigger than the existing bidding in the auction" do 
      
    end
        
    
    it "notifies the product owner for the new bidding" do
            
    end
    
    it "notifies the other bidders of the same product/auction" do 
      
    end
  end
    
  describe "DELETE /auctions/:auciton_id/biddings/:id" do
    let!(:product_with_auction) { FactoryGirl.create(:product_with_auction) }
    let!(:user) { FactoryGirl.create(:user, {:sign_in_count => 10}) }
    let!(:bidding) {FactoryGirl.create(:bidding, auction: product_with_auction, user: user, product: product_with_auction.product )}

    it "Allows a user to Withdraw this bidding" do 
      login_as(user, :scope => :user)            
      visit new_auction_bidding_path(product_with_auction)  
      fill_in "My Bid", :with => 10.0 
      click_on "Submit my bidding"
      
      visit buyer_dashboard_path
      click_on "Withdraw this bidding", match: :first
      current_path.should == buyer_dashboard_path
      page.should have_content("removed")
    end

  end

end
