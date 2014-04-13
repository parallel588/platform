require 'spec_helper'

describe "UserPasswordReset" do
  let(:test_host){ "http://localhost:3000" }
  let(:user) { FactoryGirl.create(:user, {:sign_in_count => 10}) }
  
    
  it "Requesting reset password for email that doesnt exist" do
    visit new_user_password_path
    fill_in 'Email', :with =>"an-email-that-doesnt@exist.com"
    click_on 'Send me reset password instructions'
    current_path.should == user_password_path
    page.should have_content("Email not found")
  end
  
  
  it "Requesting reset password for email that exists" do
    visit new_user_password_path
    fill_in 'Email', :with => user.email
    click_on 'Send me reset password instructions'

    current_path.should == new_user_session_path
    page.should have_content("You will receive an email with instructions on how to reset your password in a few minutes.")
  end
  
    
  
end
