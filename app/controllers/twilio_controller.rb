class TwilioController < ApplicationController

  def create
    ts = TwilioService.new
    ts.send_welcome_messages( current_user )
  end



end
