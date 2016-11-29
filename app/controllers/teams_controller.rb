class TeamsController < ApplicationController
	respond_to :html, :json
	def new
		@team = Team.new
	end

	def create
		if current_user.role == "Commissioner"
			@team = current_user.league.teams.create(team_params)
		elsif current_user.role == "Manager"
			@team = current_user.team = Team.create(team_params)
		end
		if @team.team_name == ""
			@team.team_name = "Team#{@team.id}"
			@team.tag = 'TM#{@team.id}'
			@team.save
		end
		p @team.errors.full_messages.join(". ")
		redirect_to current_user 
	end

	def show
		@team = Team.find(params[:id])

	end

	def get_events
		events = []

		#Upcoming Home Games
		hgames = get_home_games
		hgames.each do |game|
			events << {:id => game.id, :title => "<span style='color:blue'>vs. #{game.guest.tag}</span>", :start => game.date, :edit_url => edit_game_path(game)}
		end

		#Upcoming Away Games
		ggames = get_guest_games
		ggames.each do |game|
			events << {:id => game.id, :title => "<span style='color:blue'>@ #{game.home.tag}</span>", :start => game.date, :edit_url => edit_game_path(game)}
		end

		fhgames = get_finished_home_games
		fhgames.each do |game|
			events << {:id => game.id, :title => "vs. #{game.guest.tag} <br> #{game_result(game.home_score, game.guest_score)} #{game.guest_score} - #{game.home_score}", :start => game.date, :edit_url => "Finished"}
		end

		fggames = get_finished_guest_games
		fggames.each do |game|
			events << {:id => game.id, :title => "@ #{game.home.tag} <br> #{game_result(game.guest_score, game.home_score)} #{game.guest_score} - #{game.home_score}", :start => game.date, :edit_url => "Finished"}
		end

		evts = get_evts
		evts.each do |evt|
			events << {:id => evt.id, :title => "<span style='color:blue'>#{evt.description}</span>", :start => evt.date, :edit_url => edit_event_path(evt)}
		end
		render :text => events.to_json
	end

	def edit
		@team = Team.find(params[:id])
	end

	def update
		@team = Team.find(params[:id])
		if params[:manager]
			@team.manager_id = params[:manager][:manager_id]
			@team.save
		end
		if @team.update(team_params)
			flash[:success] = "Team successfully updated!"
    	redirect_to @team
    else
			flash[:error] = @team.errors.full_messages.join(". ")
			redirect_to :back
		end
	end
private
	def team_params
		params.require(:team).permit(:team_name, :tag, :pic, :symbol, :user_id)
	end
	def get_home_games
		Game.where(home: Team.find(params[:id])).where(home_score: nil)
	end
	def get_guest_games
		Game.where(guest: Team.find(params[:id])).where(home_score: nil)
	end
	def get_finished_home_games
		Game.where(home: Team.find(params[:id])).where.not(home_score: nil)
	end
	def get_finished_guest_games
		Game.where(guest: Team.find(params[:id])).where.not(home_score: nil)
	end
	def get_evts
		Event.where(team: Team.find(params[:id]))
	end
	def game_result(myScore, opponentScore)
		if myScore > opponentScore
			return "<i style='color:green'>W</i>"
		elsif opponentScore > myScore
			return "<i style='color:red'>L</i>"
		else #myScore == opponentScore
			return "<i style='color:grey'>Draw</i>"
		end
	end
end
