class Admin::OrdersController < ApplicationController

  layout "admin"
  
  after_filter :create_title  
  
protected
   
  def create_title
    flash[:title] = "Orders"
  end  
  
end
