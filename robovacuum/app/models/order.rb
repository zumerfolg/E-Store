class Order < ActiveRecord::Base
  attr_accessible :customer_id, :gst_rate, :hst_rate, :pst_rate, :status
  
  has_many :lineitems, :dependent => :destroy
  has_many :products,  :through => :lineitems
  belongs_to :customer
  
end
