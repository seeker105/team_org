require 'rails_helper'

RSpec.feature "As a coach with teams" do
  scenario 'the coach dashboard lists the player names for each team' do
    coach = create(:user)
    team1 = create(:team, coach_id: coach.id)
    team1.players.create(first_name: "bob", last_name: "p1", mobile_number: "+13034567981", uid: "232")
    team1.players.create(first_name: "cid", last_name: "p2", mobile_number: "+13032587413", uid: "323")

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(coach)

    auth_hash = {first_name: coach.first_name, last_name: coach.last_name, uid: coach.uid}
    visit mock_sign_in_path(auth_hash: auth_hash)

    within(".team-1") do
      expect(page).to have_content("Name: bob p1")
      expect(page).to have_content("Mobile Number: +13034567981")
      expect(page).to have_content("cid p2")
      expect(page).to have_content("Mobile Number: +13032587413")
    end
  end

  scenario 'on the coach dashboard user sees an "edit" button next to each team name' do
    coach = create(:user)
    team1 = create(:team, coach_id: coach.id)
    team2 = create(:team, coach_id: coach.id)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(coach)

    auth_hash = {first_name: coach.first_name, last_name: coach.last_name, uid: coach.uid}
    visit mock_sign_in_path(auth_hash: auth_hash)

    within(".team-1") do
      expect(page).to have_link("Edit")
    end
    within(".team-2") do
      expect(page).to have_link("Edit")
    end
  end

  scenario 'Clicking "Edit" on the dashboard opens the team edit form with player info filled in' do
    coach = create(:user)
    team1 = create(:team, coach_id: coach.id)
    team1.players.create(first_name: "bob", last_name: "p1", mobile_number: "+13034567981")
    team1.players.create(first_name: "cid", last_name: "p2", mobile_number: "+13032587413")

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(coach)

    auth_hash = {first_name: coach.first_name, last_name: coach.last_name, uid: coach.uid}
    visit mock_sign_in_path(auth_hash: auth_hash)
    click_link "Edit"
    expect(current_path).to eq("/teams/#{team1.slug}/edit")
    within(".player-1") do
      expect(page).to have_field('first_name[]', with: "bob")
      expect(page).to have_field('last_name[]', with: "p1")
      expect(page).to have_field('mobile_number[]', with: "+13034567981")
    end
    within(".player-2") do
      expect(page).to have_field('first_name[]', with: "cid")
      expect(page).to have_field('last_name[]', with: "p2")
      expect(page).to have_field('mobile_number[]', with: "+13032587413")
    end
  end
end
