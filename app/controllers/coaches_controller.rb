class CoachesController < ApplicationController

  def dashboard
    @teams = current_user.coaches_teams
  end
end
