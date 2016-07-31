FactoryGirl.define do
  factory :user do
    first_name { generate(:first_name) }
    last_name { generate(:last_name) }
    uid { generate(:uid) }
    team_id nil
    role 0
    mobile_number "+13034161221"
  end

  sequence :first_name do |var|
    "John-#{var}"
  end

  sequence :last_name do |var|
    "Doe-#{var}"
  end

  sequence :uid do |var|
    "#{var}"
  end

  factory :coach, class: User

  factory :team do
    name { generate(:team_name) }
  end

  sequence :team_name do |var|
    "Team-#{var}"
  end
end
