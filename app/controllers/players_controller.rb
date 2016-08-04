class PlayersController < ApplicationController
  def create
    byebug
    team = Team.find_by(slug: params[:team_slug])
    params[:first_name].each_with_index do |first_name, x|
      team.players.create(first_name: first_name, last_name: params[:last_name],
                          mobile_number: params[:mobile_number])
    end
    ts = TwilioService.new
    ts.send_welcome_messages( current_user, team )
    redirect_to roster_path(team_slug: team.slug)
  end

  def update
  end

  def new
    @team = Team.find_by(slug: params[:team_slug])
  end


end


# code for player creation:
# first_names = params[:player][:first_name]
# last_names  = params[:player][:last_name]
# mobile_numbers = params[:player][:mobile_number]
# first_names.each_with_index do |f_name, x|
#   team.players.create(first_name: f_name, last_name: last_names[x], mobile_number: mobile_numbers[x])
# end
