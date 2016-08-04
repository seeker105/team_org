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

  def edit
    @team = Team.find_by(slug: params[:team_slug])
  end

  def update
    team = Team.find_by(slug: params[:team_slug])
    team.players.clear
    params[:first_name].each_with_index do |first_name, x|
      team.players.create(first_name: first_name, last_name: params[:last_name][x],
                          mobile_number: params[:mobile_number][x])
    end
    redirect_to coach_dashboard_path
  end

  private
  def team_name
    params.require(:team).permit(:name)
  end
end
