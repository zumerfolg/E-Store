class Province < ActiveRecord::Base
  attr_accessible :gst, :hst, :name, :pst
  validates :gst, :hst, :name, :pst, :presence => true
end
