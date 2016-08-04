require 'rails_helper'

RSpec.feature "On the Create Players form", :js => true do

  scenario 'click "Save Roster". Text messages are sent and the roster is displayed' do
    # team_name = "Whata Team"
    # coach = create(:user)
    # team = create(:team, coach_id: coach.id)
    # byebug
    # players = create_list(:user, 2)
    # allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(coach)
    #
    # visit players_new_path(team_slug: team.slug)
    # save_and_open_page
    #
    # 2.times {click_button "Add player"}
    # within(".player-1") do
    #   fill_in "first_name[]", with: players[1].first_name
    #   fill_in "last_name[]", with: players[1].last_name
    #   fill_in "mobile_number[]", with: players[1].mobile_number
    # end
    # within(".player-2") do
    #   fill_in "first_name[]", with: players[1].first_name
    #   fill_in "last_name[]", with: players[1].last_name
    #   fill_in "mobile_number[]", with: players[1].mobile_number
    # end
    # byebug
    # click_button "Save Roster"
    # byebug
    # save_and_open_page
    #
    # # I expect a welcome text message to be sent to each player
    #
    # FakeSMS.contents.each_with_index do |message, x|
    #   expect(message[:from][:body]).to eq("Welcome #{players[x].full_name}! You have been added to the #{team.name}!")
    # end
    #
    # expect(current_path).to eq(roster_path(team_slug: 'whata-team'))
    # expect(page).to have_content("Welcome Text messages sent!")
  end
end
