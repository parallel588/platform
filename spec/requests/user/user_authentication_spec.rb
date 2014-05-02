require 'spec_helper'

describe "UserAuthentication" do
    let(:user) { FactoryGirl.create(:user, {:sign_in_count => 10}) }
  
    it "Email and password are matching" do
      visit new_user_session_path      
      fill_in 'Email', :with => user.email
      fill_in 'Password', :with => user.password
      click_on 'Sign in'
      # current_path.should == welcome_back_existing_user_path                  
      current_path.should == home_path                        
    end    
  
  
    it "Email doesn't exist" do
      visit new_user_session_path    
      fill_in 'Email', :with => user.email+"1"
      fill_in 'Password', :with => user.password
      click_on 'Sign in'
      current_path.should == new_user_session_path                    
    end
    
    it "Email exists but password doesn't match" do
      visit new_user_session_path    
      fill_in 'Email', :with => user.email
      fill_in 'Password', :with => user.password+"1"
      click_on 'Sign in'
      current_path.should == new_user_session_path                          
    end
    
    it "User is blocked - is not allowed to login" do
      user.lock_access!
      user.reload
      visit new_user_session_path          
      fill_in 'Email', :with => user.email
      fill_in 'Password', :with => user.password
      click_on 'Sign in'      
      current_path.should == new_user_session_path                        
    end
    
    it "User is logging out" do
      login_as(user, :scope => :user)
      visit '/'
      click_on 'Logout'
      page.should have_content 'Signed out successfully.'
    end

    it "User is redirected to login page when trying to visit a page with required authentication" do
      
    end
  
end