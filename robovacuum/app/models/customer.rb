class Customer < ActiveRecord::Base
  attr_accessible :city, :email, :first_name, :last_name, :password, :postal_code, :province_id
  
  belongs_to :province
  
  validates :email, :first_name, :last_name, :password, :province_id, :presence => true
  validates :email, :uniqueness => true  
  
end
