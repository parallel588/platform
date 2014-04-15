# This will guess the User class
FactoryGirl.define do

  factory :product do
    sequence(:name) { |n| "Fruits" }
    product_category_id FactoryGirl.create(:product_category).id    
    country "Greece"
    
    
    
    
    
    
  end
  
end