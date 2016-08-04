require 'rails_helper'

RSpec.feature "Test OAuth Login" do
    scenario 'testing OAuth login' do
      visit root_path
      expect(page).to have_content("Click here to login to facebook")
      click_link "Click here to login to facebook"
      expect(page).to have_content("Coach's Dashboard")
    end
  end
