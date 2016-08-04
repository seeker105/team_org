require 'rails_helper'

RSpec.feature "As a coach with teams" do
  scenario 'the coach dashboard lists the teams' do
    coach = create(:user)
    team1 = create(:team, coach_id: coach.id)
    team2 = create(:team, coach_id: coach.id)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(coach)
    
    auth_hash = {first_name: coach.first_name, last_name: coach.last_name, uid: coach.uid}
    visit mock_sign_in_path(auth_hash: auth_hash)
    expect(page).to have_content(team1.name)
    expect(page).to have_content(team2.name)
  end
end
