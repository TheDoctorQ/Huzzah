class VendorsController < ApplicationController

  def index
    @vendors = Vendor.all
    # render json: @products
    render template: "vendors/index"
  end
  
  def show
    @vendor = Vendor.find_by(id: params[:id])
    render template: "vendors/show"
  end

end
