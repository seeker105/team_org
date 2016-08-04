require 'rails_helper'

RSpec.feature "As a coach with teams" do
  scenario 'the coach dashboard lists the player counts for each team' do
    coach = create(:user)
    team1 = create(:team, coach_id: coach.id)
    team2 = create(:team, coach_id: coach.id)
    team2.players.create(first_name: "bob", last_name: "p1")
    team2.players.create(first_name: "cid", last_name: "p2")

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(coach)

    auth_hash = {first_name: coach.first_name, last_name: coach.last_name, uid: coach.uid}
    visit mock_sign_in_path(auth_hash: auth_hash)
    within(".team-1") do
      expect(page).to have_content("0 Player(s)")
    end
    within(".team-2") do
      expect(page).to have_content("2 Player(s)")
    end
  end
end
