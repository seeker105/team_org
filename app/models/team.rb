class Team < ApplicationRecord
  has_many :opponents
  has_many :players, class_name: "User"
  belongs_to :coach, class_name: "User",
                     foreign_key: "coach_id"
end
