class OrdersController < ApplicationController
  
  before_filter :get_cart, :only => [:new, :create]
  
  # GET /orders
  # GET /orders.json
  def index
    @orders = Order.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @orders }
    end
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
    #order_customer = Customer.joins(:orders).where("orders.id" => params[:id]).first
    order_customer = Customer.includes(:orders).where("orders.id" => params[:id]).first
    orders = order_customer.orders
    
    @product_hash = Hash.new
    @total = 0
    @tax = 0
    
    orders.each do |order|
      line_items = order.lineitems
      
      line_items.each do |line_item|
        detail_hash = {:name => '', :model_number => '', :image => '', :price => 0, :quantity => 0, :subtotal => 0}        
        product = line_item.product
        sub_total = product.price * line_item.quantity
  
        detail_hash[:name] = product.name
        detail_hash[:model_number] = product.model_number
        detail_hash[:image] = product.image
        detail_hash[:price] = product.price
        detail_hash[:quantity] = line_item.quantity
        detail_hash[:subtotal] = sub_total
        @product_hash[product.id] = detail_hash
        
        @total += sub_total  
      end
      
      @tax += (@total * order.pst_rate + @total * order.gst_rate + @total * order.hst_rate)
    end
  
    
    @total += @tax.round(2)
    
      
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @order }
    end
  end

  # GET /orders/new
  # GET /orders/new.json
  def new
    @customer_id = params[:id]
    @product_hash = Hash.new
    @total = 0
    @tax = 0

    order_customer = Customer.find(@customer_id)
    pst_rate = order_customer.province.pst
    gst_rate = order_customer.province.gst
    hst_rate = order_customer.province.hst

    
    @product_hash = session[:order]
    @product_hash.each do |key, product|
      @total += product[:subtotal]
    end
    
    @tax = (@total * pst_rate + @total * gst_rate + @total * hst_rate)
    
    @tax = @tax.round(2)
    @total += @tax
 
    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # GET /orders/1/edit
  def edit
    @order = Order.find(params[:id])
  end

  # POST /orders
  # POST /orders.json
  def create
    is_ok = true
    order_customer = Customer.find(params[:id])
    @order = order_customer.orders.build
    @province = order_customer.province
    
    @order.status = 'new'
    @order.pst_rate = @province.pst
    @order.gst_rate = @province.gst
    @order.hst_rate = @province.hst
    
    is_ok = @order.save
    
    if is_ok
      @product_hash = session[:order]
      @product_hash.each do |key, product| 
        line_item = @order.lineitems.build
        line_item.product_id = key
        line_item.quantity = product[:quantity]
        line_item.price = product[:price]
        
        is_ok = line_item.save
        break if is_ok == false
        
      end
      
      session[:cart] = nil
      session[:order] = nil      
      
    end
    

    respond_to do |format|
      if is_ok
        format.html { redirect_to show_order_path(:id => @order), notice: 'Order was successfully created.' }
        format.json { render json: @order, status: :created, location: @order }
      else
        format.html { render action: "new" }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /orders/1
  # PUT /orders/1.json
  def update
    @order = Order.find(params[:id])

    respond_to do |format|
      if @order.update_attributes(params[:order])
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order = Order.find(params[:id])
    @order.destroy

    respond_to do |format|
      format.html { redirect_to orders_url }
      format.json { head :no_content }
    end
  end
  
protected
  
  def get_cart
    session[:cart] ||= []
    session[:cart].each {|id| @my_cart << Product.find(id)}
  end
  
end
