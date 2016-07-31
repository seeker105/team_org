require 'rails_helper'

RSpec.feature "Go from the landing page to the coach dashboard" do
  scenario 'on the landing page click into the site' do
    visit landing_page_path

    click_link "Click here to continue to TeamOrg"

    expect(current_path).to eq(coach_dashboard_path)
    expect(page).to have_content("Coach's Dashboard")
    expect(page).to have_button("Add player")

    # click_button "Add player"
    #
    # within(".player-1") do
    #   expect(page).to have_field :input, count: 2
    # end
  end
end
