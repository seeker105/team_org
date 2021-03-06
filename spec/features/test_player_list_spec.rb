require 'rails_helper'

RSpec.feature "As a coach with teams" do
  scenario 'the team list on the dashboard has a player count' do
    coach = create(:user)
    team1 = create(:team, coach_id: coach.id)
    team2 = create(:team, coach_id: coach.id)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(coach)

    visit facebook_login_path
    expect(page).to have_content(team1.name)
    expect(page).to have_content(team2.name)
  end
end
