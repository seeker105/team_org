require 'rails_helper'

RSpec.feature "test the TwilioController" do
  it "sends a welcome message" do
    user = create(:user)
    team = create(:team, name: "whata", coach_id: user.id)
    team.players.create(first_name: "John", last_name: "Smith", uid: "1234567")

    visit facebook_login_path
    visit welcome_messages_path(team: team.id)
    expect(FakeSMS.contents.count).to eq(1)

    expect(FakeSMS.contents[0].from[:body]).to eq("Welcome John Smith! You have been added to the whata team!")
  end
end
