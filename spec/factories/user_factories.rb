# This will guess the User class
FactoryGirl.define do

  factory :user do
    sequence(:name) { |n| "Savvas Georgiou #{n}" }
    sequence(:email) { |n| "user#{n}@basekto.com" }
    
    vat '12345VAT'
    address_street  'Salaminos 16'
    address_city 'Athens'
    address_country 'Greece'
    address_zip '15127'
    occupation 'Self Employed'
    
    password '12345678'
    password_confirmation '12345678'
  end
  
end