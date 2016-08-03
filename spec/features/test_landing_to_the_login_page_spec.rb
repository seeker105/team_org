require 'rails_helper'

RSpec.feature "Go from the landing page to the coach dashboard", :js => true do
  scenario 'on the landing page click into the site' do
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    visit landing_page_path

    click_link "Click here to continue to TeamOrg"

    expect(current_path).to eq(coach_dashboard_path)
    expect(page).to have_content("Coach's Dashboard")
    expect(page).to have_content("Team name:")
    expect(page).to have_field 'team[name]', type: 'text'
    expect(page).to have_button("Add player")
    expect(page).to have_no_field 'player[first_name][]', type: 'text'
    expect(page).to have_no_field 'player[last_name][]', type: 'text'
    expect(page).to have_no_field 'player[mobile_number][]', type: 'text'
  end

  scenario 'on the dashboard page, add player info fields' do
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    visit landing_page_path

    click_link "Click here to continue to TeamOrg"
    click_button "Add player"
    expect(page).to have_field 'player[first_name][]', type: 'text'
    expect(page).to have_field 'player[last_name][]', type: 'text'
    expect(page).to have_field 'player[mobile_number][]', type: 'text'
  end

  scenario 'on the dashboard, add player info and click submit' do
    team_name = "Test Team"
    coach = build(:user)
    player1 = build(:user)
    player2 = build(:user)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(coach)
    visit coach_dashboard_path
    click_button "Add player"
    click_button "Add player"
    
    fill_in "team[name]", with: team_name
    within(".player-1") do
      fill_in "player[first_name][]", with: player1.first_name
      fill_in "player[last_name][]", with: player1.last_name
      fill_in "player[mobile_number][]", with: player1.mobile_number
    end
    within(".player-2") do
      fill_in "player[first_name][]", with: player2.first_name
      fill_in "player[last_name][]", with: player2.last_name
      fill_in "player[mobile_number][]", with: player2.mobile_number
    end
    click_button "Submit"

    expect(page).to have_content(team_name)
    expect(page).to have_content(player1.first_name)
    expect(page).to have_content(player1.last_name)
    expect(page).to have_content(player1.mobile_number)
    expect(page).to have_content(player2.first_name)
    expect(page).to have_content(player2.last_name)
    expect(page).to have_content(player2.mobile_number)
  end
end
