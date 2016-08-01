require 'rails_helper'

RSpec.feature "Once a Roster is created click 'Finalize' and send a welcome text" do

  scenario 'click "Finalize" on the roster page' do
    coach = create(:user)
    team = create(:team, user_id: coach.id)
    team.players << players = create_list(:user, 2)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(coach)

    visit roster_path(team.id)
    expect(page).to have_link("Finalize")
    click_link "Finalize"
    # I expect a welcome text message to be sent to each player
    
    FakeSMS.contents.each_with_index do |message, x|
      expect(message[:from][:body]).to eq("Welcome#{players[x].full_name}! You have been added to the #{team.name} team by #{coach.full_name}!")
    end

    expect(page).to have_content("Welcome Text messages sent!")
  end
end
