class Customer < ActiveRecord::Base
  attr_accessible :city, :email, :first_name, :last_name, :password, :postal_code, :province_id
end
