class HomeController < ApplicationController
  
  def index
    @home_layout = true
    @last_minute_products = Product.find(:all, :order => "name desc", :limit => 10)
    @farmers_popular_products = Product.find(:all, :order => "name desc", :limit => 10)
    @buyers_popular_products = Product.find(:all, :order => "name desc", :limit => 10)
  end
  
  
  def welcome
    
  end
  
end
