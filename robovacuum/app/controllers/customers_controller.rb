class CustomersController < ApplicationController
  
  before_filter :get_cart, :only => [:new, :create]
  before_filter :get_province,  :only => [:new, :create]
  
  
  def get_province
    @provinces = Province.order(:name)
  end  
  
  
  # GET /customers/new
  # GET /customers/new.json
  def new
    @customer = Customer.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @customer }
    end
  end

  # POST /customers
  # POST /customers.json
  def create
    @customer = Customer.new(params[:customer])

    respond_to do |format|
      if @customer.save
        format.html { redirect_to  new_order_path(:id => @customer), :notice => 'Customer was successfully created.' }
        format.json { render json: @customer, status: :created, location: @customer }
      else
        format.html { render action: "new" }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  
protected
  
  def get_cart
    session[:cart] ||= []
    session[:cart].each {|id| @my_cart << Product.find(id)}
  end
  
end
