class EventsController < ApplicationController
	def new
		@event = Event.new
	end

	def show

	end
	def create
		@event = current_user.team.events.create(event_params)
		redirect_to current_user.team
	end

	def edit
		@event = Event.find(params[:id])
	end

	def update
		@event = Event.find(params[:id])
    @event.update(event_params)
    @event.save
    redirect_to :back
  end

  def destroy
		Event.destroy(params[:id])
		redirect_to current_user.team
	end
	
private
	def event_params
		params.require(:event).permit(:date, :description)
	end
end
