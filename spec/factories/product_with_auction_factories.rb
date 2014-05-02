FactoryGirl.define do

  factory :product_with_auction, :class => "Auction" do
    product = FactoryGirl.create(:product)
    
    starting_at 	Time.now - 3.days
    ending_at    	Time.now + 3.days
    status       	"active"
    product_id   	product.id    
    starting_bid   10.0
  end
  
  
end