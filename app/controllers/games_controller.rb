class GamesController < ApplicationController
	def new
		@game = Game.new
	end
	def create

		@game = Game.new(game_params)
		@game.home = Team.find_by team_name: params[:game][:home]
		@game.guest = Team.find(params[:game][:guest])
		@game.save
		p @game.errors.full_messages.join(". ")
		redirect_to :back
	end

	def edit
		@game = Game.find(params[:id])
	end

	def update
		@game = Game.find(params[:id])
    @game.update(game_params)
    @game.save
    redirect_to :back
  end

  def destroy
  	Game.destroy(params[:id])
  	redirect_to :back
  end
private
	def game_params
		params.require(:game).permit(:date, :home_score, :guest_score)
	end
end
