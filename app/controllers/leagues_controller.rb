class LeaguesController < ApplicationController
	def new
		@league = League.new
	end
	def index
		@leagues = League.all
	end

	def show
		@league = League.find(params[:id])
	end
	def create
		@league = current_user.league = League.new(league_params)
		if @league.league_name == ""
			@league.league_name = "League#{@league.id}"
			@league.save
		end
		redirect_to current_user
	end
	def destroy
		League.destroy(params[:id])
		redirect_to current_user
	end
private
	def league_params
		params.require(:league).permit(:league_name, :sport)
	end
end
