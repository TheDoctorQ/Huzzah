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

end
