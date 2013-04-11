class Product < ActiveRecord::Base
  attr_accessible :description, :model_number, :name, :price, :stock_quantity, :image
 
   
  has_many :lineitems
  has_many :orders, :through => :lineitems
  
  validates :description, :model_number, :name, :price, :stock_quantity, :image, :presence => true
  validates :model_number, :uniqueness => true
 
  
end
