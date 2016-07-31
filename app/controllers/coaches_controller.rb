class CoachesController < ApplicationController

  def dashboard
    @team = Team.new
  end
end
