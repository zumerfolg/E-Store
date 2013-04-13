class Admin::CustomersController < ApplicationController
  
  layout "admin"
  
  after_filter :create_title,:except => [:index]

  def index
    @customers = Customer.all

    respond_to do |format|
      format.html {create_title}# index.html.erb
      format.json { render json: @customers }
    end
  end


  def show
    @customer = Customer.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @customer }
    end
  end



  # GET /customers/1/edit
  def edit
    @customer = Customer.find(params[:id])
    @provinces = Province.order(:name)
  end




  def update
    @customer = Customer.find(params[:id])

    respond_to do |format|
      if @customer.update_attributes(params[:customer])
        format.html { redirect_to admin_customer_path(@customer), notice: 'Customer was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end
  

  def destroy
    @customer = Customer.find(params[:id])
    @customer.destroy
  
    respond_to do |format|
      format.html { redirect_to customers_url }
      format.json { head :no_content }
    end
  end
  
protected
   
  def create_title
    flash[:title] = "Customers"
  end  
  
  
end
