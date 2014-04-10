require 'spec_helper'

describe "HomePages" do
    
    it "displays the home page with a signup link" do
      visit '/' 
      expect(page).to have_content 'Signup'
    
    end
end
