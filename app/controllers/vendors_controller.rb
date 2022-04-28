class VendorsController < ApplicationController

  def index
    @vendors = Vendors.all
    render template: "vendors/index"
  end
  
end
