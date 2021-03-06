require 'twilio-ruby'

class TwilioService

  def send_welcome_messages(team)
    # set up a client to talk to the Twilio REST API
    @client = Twilio::REST::Client.new ENV["twilio_account_sid"], ENV["twilio_auth_token"]
    team.players.each do |player|
      @client.account.messages.create({
        :from => '+13037207243',
        :to => player.mobile_number,
        :body => "Welcome #{player.full_name}! You have been added to the #{team.name} team!"})
    end
  end
end
