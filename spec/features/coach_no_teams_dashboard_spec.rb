require 'rails_helper'

RSpec.feature "Coach with no teams" do
  scenario 'coach no teams logs in sees dashboard and only sees "Create Teams" button' do
    coach = create(:coach)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(:coach)

    visit coach_dashboard_path
    expect(current_path).to eq(coach_dashboard_path)
    expect(page).to have_link("Create Team")
    expect(page).to have_no_css(".team_list")
  end

  scenario 'coach clicks on the "Create Team" button' do
    coach = create(:coach)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(:coach)

    visit coach_dashboard_path
    click_link "Create Team"

    expect(current_path).to eq(team_new_path)
    expect(page).to have_content("Create Team")
    expect(page).to have_field("team[name]")
    expect(page).to have_button("Create")
  end

  scenario 'coach creates a team' do
    coach = create(:coach)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(coach)
    team_name = "Whata team"

    visit coach_dashboard_path
    click_link "Create Team"

    fill_in "team_name", with: team_name
    click_button "Create"

    expect(current_path).to eq(player_new_path)
    expect(page).to have_content("Create Players")
    expect(page).to have_button("Add player")
    expect(page).to have_field("first_name[]")
    expect(page).to have_field("last_name[]")
    expect(page).to have_field("mobile_number[]")
    expect(page).to have_button("Save Roster")

    # As a coach with no teams
    #
    # When i visit the team creation form
    # and I enter a team name
    # And I click create
    #
    # I expect to be taken to the player creation form
  end
end
