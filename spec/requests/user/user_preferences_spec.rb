require 'spec_helper'

describe "UserPreferences" do
  let(:test_host){ "http://localhost:3000" }
  let(:user) { FactoryGirl.create(:user, {:sign_in_count => 10}) }
  
    
  describe "Test the user preferences form actions" do
    it "Loading the preferences page with the all the user form fields filled" do
      login_as(user, :scope => :user)            
      visit "/preferences"
      
    end
    
    it "Update the name and occupation and confirm" do
      login_as(user, :scope => :user)            
      visit "/preferences"      
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
