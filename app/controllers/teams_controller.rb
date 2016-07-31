class TeamsController < ApplicationController
  def create
    byebug
    team = Team.create(name: team_name[:name], user_id: current_user.id )
    first_names = params[:player][:first_name]
    last_names  = params[:player][:last_name]
    first_names.each_with_index do |f_name, x|
      team.players.create(first_name: f_name, last_name: last_names[x])
    end
    byebug
  end


  private
  def team_name
    params.require(:team).permit(:name)
  end

  # def player_params
  #   params.require(:player).permit(:first_name, :last_name)
  # end
end
