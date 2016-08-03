class Team < ApplicationRecord
  before_save :slugify_name

  belongs_to :coach, class_name: "User",
                     foreign_key: "coach_id",
                     required: false#,
                    #  inverse_of: :coaches_teams
  has_many :team_players
  has_many :players, through: :team_players,
                     class_name: "User",
                     source: "user"

  def slugify_name
    self.slug = name.parameterize
  end
end
