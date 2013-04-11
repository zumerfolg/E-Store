class Order < ActiveRecord::Base
  attr_accessible :customer_id, :gst_rate, :hst_rate, :pst_rate, :status
  
  has_many :lineitems
  has_many :products, :through => :lineitems
  
end
