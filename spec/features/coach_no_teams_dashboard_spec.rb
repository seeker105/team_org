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
    expect(current_path).to eq(team_create_path)
    expect(page).to have_content("Create Team")
    expect(page).to have_field("Team Name")
    expect(page).to have_link("Create")
  end
end
