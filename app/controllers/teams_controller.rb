class TeamsController < ApplicationController
  def create
    team = Team.create(name: team_name[:name], coach: current_user )
    redirect_to players_new_path
  end

  def index
    @team = Team.find(params[:id])
    @players = @team.players
  end

  def new
    @team = Team.new
  end

  private
  def team_name
    params.require(:team).permit(:name)
  end

  # def player_params
  #   params.require(:team).require(:player).permit(:first_name, :last_name)
  # end

  # def player_params
  #   params.require(:player).permit(:first_name, :last_name)
  # end
end
