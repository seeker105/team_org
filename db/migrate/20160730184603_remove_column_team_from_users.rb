class RemoveColumnTeamFromUsers < ActiveRecord::Migration[5.0]
  def change
    remove_reference :users, :team, foreign_key: true 
  end
end
