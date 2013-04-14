class Admin::OrdersController < ApplicationController

  layout "admin"
  
  after_filter :create_title, :except => [:index]
  
  
  def index
    @orders = Order.all

    respond_to do |format|
      format.html {create_title}# index.html.erb
      format.json { render json: @orders }
    end
  end

  # GET /abouts/1
  # GET /abouts/1.json
  def show
    @order = Order.find(params[:id])
    @customer = @order.customer

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @order }
    end
  end


  # GET /abouts/1/edit
  def edit
    @order = Order.find(params[:id])
  end


  # PUT /abouts/1
  # PUT /abouts/1.json
  def update
    @order = Order.find(params[:id])

    respond_to do |format|
      if @order.update_attributes(params[:about])
        format.html { redirect_to admin_order_path(@order), notice: 'Order was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /abouts/1
  # DELETE /abouts/1.json
  def destroy
    @order = Order.find(params[:id])
    @order.destroy

    respond_to do |format|
      format.html { redirect_to admin_orders_path }
      format.json { head :no_content }
    end
  end  
  
protected
   
  def create_title
    flash[:title] = "Orders"
  end  
  
end
