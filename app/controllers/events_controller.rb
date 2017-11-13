class EventsController < ApplicationController
  before_action :logged_in?, only: [:new, :create]

  def new
    @event = Event.new
  end

  def create
    @event = current_user.events.build(event_params)
    if @event.save
      flash[:success] = "Event successfully created"
      redirect_to current_user
    else
      flash.now[:danger] = "Event not created!"
      render :new
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  def index
    @events = Event.all
  end

  def register
    @event = Event.find(params[:id])
    @invite = @event.invites.build(attendee: current_user)
    if @invite.save
      flash.now[:success] = "Successfully registered for #{@event.name}!"
      render :show
    else
      flash.now[:danger] = "Unsuccessful registration"
      render :show
    end
  end

  private

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
