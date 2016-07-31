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

    click_button "Add player"
    expect(page).to have_field 'player[first_name][]', type: 'text'
    expect(page).to have_field 'player[last_name][]', type: 'text'
    # within(".player-1") do
    #   expect(page).to have_field :input, count: 2
    # end
  end
end
