require 'spec_helper'

describe "UserSubscription" do
  let(:test_host){ "http://localhost:3000" }

    
  describe "[Successfull] User Susbcription Signup" do
    it "submits the signup form with all fields - success" do
      user = build(:user)
      
      visit "/signup"
      
      fill_in 'Email', :with =>  user.email
      fill_in 'Name', :with => user.name
      fill_in 'Vat', :with => user.vat
      fill_in 'Occupation', :with => user.occupation
      fill_in 'street', :with => user.address_street
      fill_in 'zip', :with => user.address_zip
      select(user.address_country, :from => 'Address country')      
      fill_in 'Password', :with => '12345678'
      fill_in 'Password confirmation', :with => '12345678'      
      click_on 'Sign up'      
      # current_path.should == welcome_new_user_path            
      current_path.should == home_path
    end
  end
  
  
  describe "[Fail] User subscription fails" do
    it "submits subscription without email" do
      user = build(:user)
      visit "/signup"
      
      fill_in 'Password', :with => '12345678'
      fill_in 'Password confirmation', :with => '12345678'      
      click_on 'Sign up'
      current_path.should == new_user_registration_path            
    end

     it "submits subscription without password" do
        user = build(:user)
        visit "/signup"
        
        fill_in 'Email', :with =>  user.email
        fill_in 'Password', :with => '12345678'
        click_on 'Sign up'
        current_path.should == new_user_registration_path            
      end
  end
  
  
end
