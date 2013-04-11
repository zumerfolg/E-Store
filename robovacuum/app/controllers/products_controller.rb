class ProductsController < ApplicationController
  
   before_filter :initialize_cart, :only => [:add_cart, :index, :show, :show_cart]
  
  
  # GET /products
  # GET /products.json
  def index
    @products = Product.where('stock_quantity > 0').order(:name)
    calculate_cart

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @products }
    end
  end

  # GET /products/1
  # GET /products/1.json
  def show
    @product = Product.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @product }
    end
  end
  
  def about
    
  end
  
  def contact
  end
  
  def home
  end
  
  def search
    keywords = params[:keywords]
    if keywords.blank?
       redirect_to root_path
    end
    @products = Product.where("name LIKE ? OR description LIKE ?", "%#{keywords}%", "%#{keywords}%").order(:name)
  end
  
  def add_cart
    session[:cart] << params[:token].to_i
    calculate_cart
    render :json => @my_cart.size
  end
  
  def empty_cart
    session[:cart] = nil
    redirect_to root_url
  end
  
  def show_cart
    calculate_cart
    
    @product_hash = Hash.new
    @total = 0
    
    @my_cart.each do |product|
    detail_hash = {:name => '', :model_number => '', :image => '', :price => 0, :quantity => 0, :subtotal => 0}      
      if @product_hash.has_key?(product.id)
        temp_hash = @product_hash[product.id]
        temp_hash[:quantity] += 1
        temp_hash[:subtotal] += product.price
        @product_hash[product.id] = temp_hash
      else
        detail_hash[:name] = product.name
        detail_hash[:model_number] = product.model_number
        detail_hash[:image] = product.image
        detail_hash[:price] = product.price
        detail_hash[:subtotal] = product.price
        detail_hash[:quantity] = 1
        @product_hash[product.id] = detail_hash
      end
      @total += detail_hash[:subtotal]
    end
    
  end
  
  def check_out

  end
  
protected
  def initialize_cart
    session[:cart] ||= []
  end
  
  def calculate_cart
    session[:cart].each {|id| @my_cart << Product.find(id)}    
  end
 
end
