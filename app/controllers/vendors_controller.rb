class VendorsController < ApplicationController

  def index
    @vendors = Vendor.all
    # render json: @products
    render template: "vendors/index"
  end
  
end
