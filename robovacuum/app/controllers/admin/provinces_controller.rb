class Admin::ProvincesController < ApplicationController
 
  layout "admin"
  
  # GET /admin/provinces
  def index
    @admin_provinces = Province.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @admin_provinces }
    end
  end

  # GET /admin/provinces/1
  # GET /admin/provinces/1.json
  def show
    @admin_province = Province.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @admin_province }
    end
  end

  # GET /admin/provinces/new
  # GET /admin/provinces/new.json
  def new
    @admin_province = Province.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @admin_province }
    end
  end

  # GET /admin/provinces/1/edit
  def edit
    @admin_province = Province.find(params[:id])
  end


  def create
    @admin_province = Province.new(params[:province])

    respond_to do |format|
      if @admin_province.save
        format.html { redirect_to admin_province_path(@admin_province), notice: 'Province was successfully created.' }
        format.json { render json: @admin_province, status: :created, location: @admin_province }
      else
        format.html { render action: "new" }
        format.json { render json: @admin_province.errors, status: :unprocessable_entity }
      end
    end
  end


  def update
    @admin_province = Province.find(params[:id])

    respond_to do |format|
      if @admin_province.update_attributes(params[:province])
        format.html { redirect_to admin_province_path(@admin_province), notice: 'Province was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @admin_province.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @province = Province.find(params[:id])
    @province.destroy

    respond_to do |format|
      format.html { redirect_to admin_provinces_url }
      format.json { head :no_content }
    end
  end  
  
  
end
