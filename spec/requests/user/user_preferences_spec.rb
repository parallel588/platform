require 'spec_helper'

describe "UserPreferences" do
  let(:test_host){ "http://localhost:3000" }
  let(:user) { FactoryGirl.create(:user, {:sign_in_count => 10}) }
  
    
  describe "Test the user preferences form actions" do
    it "Redirects the user to the login page when he is not logged in and tries to see the prefernces page" do
      visit user_prefernces_path     
      current_path.should == new_user_session_path                          
    end
    
    it "Loading the preferences page with the all the user form fields filled" do
      login_as(user, :scope => :user)            
      visit user_prefernces_path     
      find_field('Name').value == user.name
      find_field('Occupation').value == user.occupation
      find_button('Update preferences')
    end
    
    it "Update the name and occupation and confirm" do
      login_as(user, :scope => :user)            
      visit user_prefernces_path     
      fill_in 'Name', :with => "New Name"
      fill_in 'Occupation', :with => "New Occupation"
      click_on ('Update preferences')
      
      current_path.should == "/"
      user.reload
      user.name.should == "New Name"
      user.occupation.should == "New Occupation"      
    end
    
    it "Update the password of the user" do
      login_as(user, :scope => :user)            
      visit user_prefernces_path     
      fill_in 'Password', :with=> "MyNewPassword"
      fill_in 'Password confirmation', :with => "MyNewPassword"
      click_on('Update preferences')
  
      # The user is getting logged out when the password changes.
      page.should have_content('Login')      
      current_path.should == "/"
      
      # The user tries to login with the new  password
      visit new_user_session_path
      fill_in 'Email', :with => user.email
      fill_in 'Password', :with => "MyNewPassword"
      click_on "Sign in"
      current_path.should == welcome_back_existing_user_path
      page.should have_content(user.email)
    end
    
    it "Doesn't update the  the password of the user if the user doesn't fill in the same password 2 times " do
      login_as(user, :scope => :user)            
      visit user_prefernces_path     
      fill_in 'Password', :with=> "MyNewPassword"
      fill_in 'Password confirmation', :with => "MyNewPassword-2" 
      click_on('Update preferences')
      
      page.should have_content('Preferences not saved.')      
      current_path.should == user_prefernces_path
    end
    
    
    
    
    it "Update the user Logo" do
      login_as(user, :scope => :user)            
      visit user_prefernces_path     
      attach_file('user[logo]', File.join(Rails.root, '/spec/support/files/user-logo-1.jpg'))
      click_on('Update preferences')
      
      current_path.should == "/"
      user.reload
      user.logo_url.should == "/uploads/user/#{user.id}/logo/user-logo-1.jpg"
      
    end
    
    
  end
  
  
  
end
