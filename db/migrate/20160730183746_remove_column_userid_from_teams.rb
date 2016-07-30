class RemoveColumnUseridFromTeams < ActiveRecord::Migration[5.0]
  def change
    remove_reference :teams, :user, foreign_key: true  
  end
end
