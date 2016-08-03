class PlayersController < ApplicationController
  def create
  end

  def update
  end

  def new
    
  end
end


# code for player creation:
# first_names = params[:player][:first_name]
# last_names  = params[:player][:last_name]
# mobile_numbers = params[:player][:mobile_number]
# first_names.each_with_index do |f_name, x|
#   team.players.create(first_name: f_name, last_name: last_names[x], mobile_number: mobile_numbers[x])
# end
