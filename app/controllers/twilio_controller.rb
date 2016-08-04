class TwilioController < ApplicationController

  def create
    ts = TwilioService.new
    team = Team.find(params[:team])
    ts.send_welcome_messages( team )
  end
end
