class User < ApplicationRecord
  belongs_to :team
  has_one :coaches_team, class_name: "Team",
                        foreign_key: "user_id"

  enum role: %w(coach player)


  def self.find_or_create_from_auth_hash(auth_info)
    where(uid: auth_info.uid).first_or_create do |new_user|
      new_user.first_name = auth_info.first_name
      new_user.last_name = auth_info.last_name
      new_user.uid = auth_info.uid
    end
  end
end
