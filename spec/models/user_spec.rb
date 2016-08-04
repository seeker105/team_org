require 'rails_helper'

RSpec.describe User do
  it "creates a new user" do
    auth_hash = OpenStruct.new(first_name:  "Testing",
                 last_name:   "The auth hash",
                 uid:         "33475")
    expect {user = User.find_or_create_from_auth_hash(auth_hash)}.to change{ User.count }
  end
end
