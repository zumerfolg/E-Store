class Admin::AboutsController < ApplicationController

  layout "admin"

  after_filter :create_title, :except => [:index]

  # GET /abouts
  # GET /abouts.json
  def index
    @admin_abouts = About.all

    respond_to do |format|
      format.html {create_title}# index.html.erb
      format.json { render json: @admin_abouts }
    end
  end

  # GET /abouts/1
  # GET /abouts/1.json
  def show
    @admin_about = About.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @admin_about }
    end
  end

  # GET /abouts/new
  # GET /abouts/new.json
  def new
    @admin_about = About.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @admin_about }
    end
  end

  # GET /abouts/1/edit
  def edit
    @admin_about = About.find(params[:id])
  end

  # POST /abouts
  # POST /abouts.json
  def create
    @admin_about = About.new(params[:about])

    respond_to do |format|
      if @admin_about.save
        format.html { redirect_to admin_about_path(@admin_about), notice: 'About was successfully created.' }
        format.json { render json: @admin_about, status: :created, location: @admin_about }
      else
        format.html { render action: "new" }
        format.json { render json: @admin_about.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /abouts/1
  # PUT /abouts/1.json
  def update
    @admin_about = About.find(params[:id])

    respond_to do |format|
      if @admin_about.update_attributes(params[:about])
        format.html { redirect_to admin_about_path(params[:id]), notice: 'About was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { redirect_to edit_admin_about_path(@admin_about) }
        format.json { render json: @admin_about.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /abouts/1
  # DELETE /abouts/1.json
  def destroy
    @admin_about = About.find(params[:id])
    @admin_about.destroy

    respond_to do |format|
      format.html { redirect_to admin_abouts_url }
      format.json { head :no_content }
    end
  end
  
protected
   
  def create_title
    flash[:title] = "Abouts"
  end  

end
