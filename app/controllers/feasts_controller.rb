class FeastsController < ApplicationController
  def index
    @feasts = Feast.all
    # render json: @feasts
    render template: "feasts/index"
  end
  
  def show
    @feast = Feast.find_by(id: params[:id])
    render template: "feasts/show"
  end

  def create
    @feast = Feast.new(
      name: params[:name], 
      variety: params[:variety],
      location: params[:location]
    )
    
    if @feast.save
      params[:images].each do |image|
        image = Image.new(url: image, feast_id: @feast.id)
        image.save
      end
      render json: @feast.as_json
    else
      render json: {errors: @feast.errors.full_messages}, status: :unprocessable_entity
    end
    
  end

  def update
    # find the right feast
    @feast = Feast.find_by(id: params[:id])
    # modify that feast
    @feast.name = params[:name] || @feast.name
    @feast.variety = params[:variety] || @feast.variety
    @feast.location = params[:location] || @feast.location

    if @feast.save
      render json: @feast
    else
      render json: {errors: @feast.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def destroy
    feast = Feast.find_by(id: params[:id])
    feast.destroy
    render json: {message: "feast removed"}
  end
end
