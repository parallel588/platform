class Order < ActiveRecord::Base

  belongs_to :auction
  belongs_to :bidding
  belongs_to :user


  include AASM


  aasm :skip_validation_on_save => true, :column => 'status' do
    # Statuses by the byer
    state :initialized, :initial => true
    state :placed
    state :paid

    event :confirm do
      transitions :from => [:initialized, :placed], :to => :placed
    end


    # Statuses by the seller / support team
    state :fullfiled
    state :shipped    
    
    # Soft delete status
    state :archived    
  end  
  




end
