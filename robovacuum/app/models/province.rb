class Province < ActiveRecord::Base
  attr_accessible :gst, :hst, :name, :pst
  validate :gst, :hst, :name, :pst, :presence => true
end
