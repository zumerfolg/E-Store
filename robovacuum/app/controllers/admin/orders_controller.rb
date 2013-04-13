class Admin::OrdersController < ApplicationController

  layout "admin"
  
  after_filter :create_title, :except => [:index]
  
  
  def index
    @orders = Order.all

    respond_to do |format|
      format.html {create_title}# index.html.erb
      format.json { render json: @abouts }
    end
  end

  # GET /abouts/1
  # GET /abouts/1.json
  def show
    @about = About.find(1)

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @about }
    end
  end


  # GET /abouts/1/edit
  def edit
    @about = About.find(params[:id])
  end


  # PUT /abouts/1
  # PUT /abouts/1.json
  def update
    @about = About.find(params[:id])

    respond_to do |format|
      if @about.update_attributes(params[:about])
        format.html { redirect_to @about, notice: 'About was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @about.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /abouts/1
  # DELETE /abouts/1.json
  def destroy
    @about = About.find(params[:id])
    @about.destroy

    respond_to do |format|
      format.html { redirect_to abouts_url }
      format.json { head :no_content }
    end
  end  
  
protected
   
  def create_title
    flash[:title] = "Orders"
  end  
  
end
