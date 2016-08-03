class TeamsController < ApplicationController
  def create
    team = Team.create(name: team_name[:name], user_id: current_user.id )
    first_names = params[:player][:first_name]
    last_names  = params[:player][:last_name]
    mobile_numbers = params[:player][:mobile_number]
    first_names.each_with_index do |f_name, x|
      team.players.create(first_name: f_name, last_name: last_names[x], mobile_number: mobile_numbers[x])
    end
    redirect_to roster_path(team.id)
  end

  def index
    @team = Team.find(params[:id])
    @players = @team.players
  end

  private
  def team_name
    params.require(:team).permit(:name)
  end

  def player_params
    params.require(:team).require(:player).permit(:first_name, :last_name)
  end

  # def player_params
  #   params.require(:player).permit(:first_name, :last_name)
  # end
end
