FactoryGirl.define do
  factory :user do
    first_name "John"
    last_name "Doe"
    uid { generate(:uid) }
    role 0
    mobile_number "+13034161221"
  end

  sequence :uid do |var|
    "#{var}"
  end

  factory :team do
    name { generate(:team_name) }
    coach_id nil
  end

  sequence :team_name do |var|
    "Team-#{var}"
  end
end
