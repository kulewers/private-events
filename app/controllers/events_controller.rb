class EventsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

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
    @event = current_user.hosted_events.build(event_allowed_parameters)

    if @event.save
      flash[:success] = `Event "#{@event.title}" created!`
      redirect_to @event
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
  def event_allowed_parameters
    params.require(:event).permit(:title, :description, :location, :date)
  end
end
