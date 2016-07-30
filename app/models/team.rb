class Team < ApplicationRecord
  belongs_to :coach, class_name: "User",
                     foreign_key: "user_id",
                     required: false
  has_many :team_players
  has_many :players, through: :team_players,
                     class_name: "User",
                     source: "user"
end