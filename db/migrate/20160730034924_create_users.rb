class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :uid
      t.integer :role
      t.integer :team_id, foreign_key: true
      t.integer :coach_id
    end
    add_index :users, :coach_id
  end
end
