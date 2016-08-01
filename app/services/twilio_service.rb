require 'twilio-ruby'

class TwilioService

  def send_welcome_messages(current_user)
    # set up a client to talk to the Twilio REST API
    @client = Twilio::REST::Client.new ENV["twilio_account_sid"], ENV["twilio_auth_token"]
    current_user.players.each do |player|
      @client.account.messages.create({
        :from => '+13037207243',
        :to => player.mobile_number,
        :body => "Welcome#{player.full_name}! You have been added to the #{current_user.team_name} team by #{current_user.full_name}!",
      })
    end
  end
end
