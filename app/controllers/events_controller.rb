class EventsController < ApplicationController

   before_filter :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  def index
    @events = Event.all

    respond_to do |format|
      format.html # index.html.erb
      format.json
    end
  end

  def show
    @event = Event.find(params[:id])

  end

  def new
    @event = Event.new
    authorize @event
  end

  def create
    @event = Event.create(event_params)
    #Creamos la asociacion con factoryGirl
    @event.user = current_user

    authorize @event
    if @event.save
        redirect_to @event
    else
       render :new
    end
  end

  def edit
    @event = Event.find(params[:id])

    authorize @event
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

  def search
    @event = Event.where( 'name LIKE %?%', params[:terms])
  end
  
  rescue_from ActiveRecord::RecordNotFound, with: :not_found

  private

  def event_params
       params.require(:event).permit(:name, :description, :start_at, :end_at, :address)
  end

  def not_found
    flash[:error] = "Event does not exist"
    render action: 'not_found'
  end
end
