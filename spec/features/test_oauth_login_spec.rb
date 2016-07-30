require 'rails_helper'

RSpec.feature "Test OAuth Login" do
  include Capybara::DSL
  before(:example) do
    Capybara.app = TeamOrg::Application
    stub_omniauth
  end

  def stub_omniauth
    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[:facebook] = OmniAuth::AuthHash.new({
      provider: 'facebook',
      uid: "1234567",
      first_name: "John",
      last_name: "Smith"
      })
    end

    scenario 'testing OAuth stub' do
      byebug
      
      visit root_path
      expect(page).to have_content("Click here to login to facebook")
      click_link "Click here to login to facebook"
      expect(page).to have_content("Click here to continue to TeamOrg")
    end
  end
