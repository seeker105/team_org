require 'rails_helper'

RSpec.describe Team do
  it 'saves a slug of the name for a new team' do
    team = Team.create!(name: "What An Amazing Name!")
    expect(team.slug).to eq("what-an-amazing-name")
  end
end
