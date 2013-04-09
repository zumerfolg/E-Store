class Product < ActiveRecord::Base
  attr_accessible :description, :model_number, :name, :price, :stock_quantity, :image
end
