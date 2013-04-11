class Province < ActiveRecord::Base
  attr_accessible :gst, :hst, :name, :pst
  validates :gst, :hst, :name, :pst, :presence => true
  
  has_many :customers
  
end
