require 'rails_helper'

RSpec.feature "As a coach with teams" do
  scenario 'the coach dashboard lists the player counts for each team' do
    coach = create(:user)
    team1 = create(:team, coach_id: coach.id)
    team2 = create(:team, coach_id: coach.id)
    team2.players.create(first_name: "bob", last_name: "p1")
    team2.players.create(first_name: "cid", last_name: "p2")

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(coach)

    user = create(:user)
    team = create(:team, name: "whata", coach_id: user.id)
    team.players.create(first_name: "John", last_name: "Smith", uid: "1234567")

    visit facebook_login_path
    within(".team-1") do
      expect(page).to have_content("0 Player(s)")
    end
    within(".team-2") do
      expect(page).to have_content("2 Player(s)")
    end
  end
end
