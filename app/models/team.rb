class Team < ApplicationRecord
  before_create :slugify_name

  belongs_to :coach, class_name: "User",
                     foreign_key: "coach_id",
                     required: false
  has_many :team_players
  has_many :players, through: :team_players,
                     class_name: "User",
                     source: "user"


  def slugify_name
    self.slug = name.parameterize
  end
end
