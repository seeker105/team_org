class PlayersController < ApplicationController
  def create
    team = Team.find_by(slug: params[:team_slug])
    params[:first_name].each_with_index do |first_name, x|
      team.players.create(first_name: first_name, last_name: params[:last_name][x],
                          mobile_number: params[:mobile_number][x])
    end
    ts = TwilioService.new
    ts.send_welcome_messages(team)
    redirect_to roster_path(team_slug: team.slug)
  end

  def new
    @team = Team.find_by(slug: params[:team_slug])
  end
end
