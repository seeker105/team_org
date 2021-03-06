require 'rails_helper'

RSpec.feature "As a coach with teams" do
  scenario 'the coach dashboard lists the player names for each team' do
    coach = create(:user)
    team1 = create(:team, coach_id: coach.id)
    team1.players.create(first_name: "bob", last_name: "p1", mobile_number: "+13034567981", uid: "232")
    team1.players.create(first_name: "cid", last_name: "p2", mobile_number: "+13032587413", uid: "323")

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(coach)

    visit facebook_login_path

    within(".team-1") do
      expect(page).to have_content("Name: bob p1")
      expect(page).to have_content("Mobile Number: +13034567981")
      expect(page).to have_content("cid p2")
      expect(page).to have_content("Mobile Number: +13032587413")
    end
  end
end
