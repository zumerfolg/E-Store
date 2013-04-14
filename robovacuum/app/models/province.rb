class Province < ActiveRecord::Base
  attr_accessible :gst, :hst, :name, :pst
  
  validates :name, :gst, :hst, :pst, :presence => true
  validates :name, :uniqueness => true
  validates :gst, :hst, :pst, :numericality => true
  
  has_many :customers
  
end
