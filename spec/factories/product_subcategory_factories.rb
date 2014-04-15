# This will guess the User class
FactoryGirl.define do

  p_category = FactoryGirl.create(:product_category)
  factory :product_subcategory do
    p_subcategory = FactoryGirl.create(:product_category, { name: "Strawberries", parent: p_category})    
  end
  
  
end