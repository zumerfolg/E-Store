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
