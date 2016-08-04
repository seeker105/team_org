class TeamsController < ApplicationController
  def create
    team = Team.create(name: team_name[:name], coach: current_user )
    redirect_to players_new_path(team_slug: team.slug)
  end

  def index
    @team = Team.find_by(slug: params[:team_slug])
    @players = @team.players
  end

  def new
    @team = Team.new
  end

  private
  def team_name
    params.require(:team).permit(:name)
  end
end
