class ApplicationController < ActionController::Base
  
  protect_from_forgery
  
  before_filter :create_mycart
  

  
protected 
  def create_mycart
    @my_cart = []
  end
  
end
