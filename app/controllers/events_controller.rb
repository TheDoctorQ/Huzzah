class EventsController < ApplicationController
  def index
    @events = Event.all
    # render json: @events
    render template: "events/index"
  end
  
  def show
    @event = Event.find_by(id: params[:id])
    render template: "events/show"
  end

  def create
    @event = Event.new(
      title: params[:title], 
      time: params[:time],
      location: params[:location]
    )
    
    if @event.save
      params[:images].each do |image|
        image = Image.new(url: image, event_id: @event.id)
        image.save
      end
      render json: @event.as_json
    else
      render json: {errors: @event.errors.full_messages}, status: :unprocessable_entity
    end
    
  end

  def update
    # find the right event
    @event = Event.find_by(id: params[:id])
    # modify that event
    @event.title = params[:title] || @event.title
    @event.time = params[:time] || @event.time
    @event.location = params[:location] || @event.location

    if @event.save
      render json: @event
    else
      render json: {errors: @event.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def destroy
    event = Event.find_by(id: params[:id])
    event.destroy
    render json: {message: "event removed"}
  end
end
