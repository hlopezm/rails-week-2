class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.create(event_params)
    redirect_to @events
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    if @event.update_attributes(event_params)
      redirect_to event_path(@event)
    else
     render edit 
    end
  end

  def destroy
    @events = Event.where   
  end

  private

  def event_params
       params.require(:event).permit(:name, :description, :start_at, :end_at, :address)
  end
end
