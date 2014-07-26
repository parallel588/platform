class Order < ActiveRecord::Base
  include AASM


  aasm :skip_validation_on_save => true, :column => 'status' do
    state :initialized, :initial => true
    state :requested
    state :fullfiled
    state :shipped    
    

      
    
  end  
  
end
