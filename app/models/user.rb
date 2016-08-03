class User < ApplicationRecord
  has_one :coaches_team, class_name: "Team",
                         foreign_key: "user_id",
                         required: false,
                         inverse_of: "coach"
  has_many :team_players
  has_many :teams, through: :team_players

  def self.find_or_create_from_auth_hash(auth_info)
    where(uid: auth_info.uid).first_or_create do |new_user|
      new_user.first_name = auth_info.first_name
      new_user.last_name = auth_info.last_name
      new_user.uid = auth_info.uid
    end
  end

  def full_name
    "#{first_name} #{last_name}"
  end
end
