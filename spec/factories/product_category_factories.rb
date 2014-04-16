# This will guess the User class
FactoryGirl.define do

  factory :product_category do
    sequence(:name) { |n| "Fruit #{n}" }    
  end
  
  
end