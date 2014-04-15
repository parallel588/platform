# This will guess the User class
FactoryGirl.define do

  factory :product_category do
    sequence(:name) { |n| "Fruits" }    
    p_category = FactoryGirl.create(:product_category)
    p_subcategory = FactoryGirl.create(:product_category, { name: "Strawberries", parent: p_category})    
  end
  
  
end