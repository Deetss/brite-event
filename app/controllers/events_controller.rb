class EventsController < ApplicationController
  before_action :logged_in?, only: [:new, :create]

  def new
    @event = Event.new
  end

  def create
    @event = current_user.events.build(event_params)
    if @event.save
      flash[:success] = "Event successfully created"
      register_user_for_event(current_user, @event)
      redirect_to current_user
    else
      render :new
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  def index
    @events = Event.all
    @upcoming_events = Event.upcoming
    @past_events = Event.past
  end

  def register
    @event = Event.find(params[:id])
    if register_user_for_event(current_user, @event)
      flash.now[:success] = "Successfully registered for #{@event.name}!"
      redirect_to @event
    else
      flash[:danger] = "Unsuccessful registration"
      redirect_to @event
    end
  end

  private
  
  def register_user_for_event(user, event)
    event.attendees << user
  end
  
  def event_params
    params.require(:event).permit(:name, :description, :date, :time)
  end
  
  # Filters

  def logged_in?
    if current_user.nil?
      flash[:warning] = 'You need to be logged in to do that!'
      redirect_to login_path
    end
  end

end
