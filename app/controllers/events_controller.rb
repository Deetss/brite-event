class EventsController < ApplicationController
  def new
    @event = Event.new
  end

  def create
    @event = @current_user.events.build(event_params)
    if @event.save
      flash[:success] = "Event successfully created"
      redirect_to @current_user
    else
      flash.now[:danger] = "Event not created!"
      render :new
    end
  end

  def show
  end

  def index
    @events = Event.all
  end

  private

  def event_params
    params.require(:event).permit(:name, :description, :date)
  end

end
