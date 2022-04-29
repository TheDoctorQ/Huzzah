class VendorsController < ApplicationController

  def index
    @vendors = Vendor.all
    # render json: @vendors
    render template: "vendors/index"
  end
  
  def show
    @vendor = Vendor.find_by(id: params[:id])
    render template: "vendors/show"
  end

  def create
    @vendor = Vendor.new(
      name: params[:name], 
      location: params[:location],
      wares: params[:wares]
    )
    
    if @vendor.save
      params[:images].each do |image|
        image = Image.new(url: image, vendor_id: @vendor.id)
        image.save
      end
      render json: @vendor.as_json
    else
      render json: {errors: @vendor.errors.full_messages}, status: :unprocessable_entity
    end
    
  end

  def update
    # find the right vendor
    @vendor = Vendor.find_by(id: params[:id])
    # modify that vendor
    @vendor.name = params[:name] || @vendor.name
    @vendor.location = params[:location] || @vendor.location
    @vendor.wares = params[:wares] || @vendor.wares

    if @vendor.save
      render json: @vendor
    else
      render json: {errors: @vendor.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def destroy
    vendor = Vendor.find_by(id: params[:id])
    vendor.destroy
    render json: {message: "vendor removed"}
  end

end
