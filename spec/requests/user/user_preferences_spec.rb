require 'spec_helper'

describe "UserPreferences" do
  let(:test_host){ "http://localhost:3000" }
  let(:user) { FactoryGirl.create(:user, {:sign_in_count => 10}) }
  
    
  describe "Test the user preferences form actions" do
    it "Redirects the user to the login page when he is not logged in and tries to see the prefernces page" do
      visit "/preferences"
      current_path.should == new_user_session_path                          
    end
    
    it "Loading the preferences page with the all the user form fields filled" do
      login_as(user, :scope => :user)            
      visit "/preferences"
      find_field('Name').value == user.name
      find_field('Occupation').value == user.occupation
      find_button('Update preferences')
    end
    
    it "Update the name and occupation and confirm" do
      login_as(user, :scope => :user)            
      visit "/preferences"      
      fill_in 'Name', :with => "New Name"
      fill_in 'Occupation', :with => "New Occupation"
      click_on ('Update preferences')
      
      current_path.should == "/"
      
    end
    
    it "Update the password of the user" do
      login_as(user, :scope => :user)            
      visit "/preferences"      
    end
    
    
    it "Update the user Logo" do
      login_as(user, :scope => :user)            
      visit "/preferences"      
    end
    
    
  end
  
  
  
end
