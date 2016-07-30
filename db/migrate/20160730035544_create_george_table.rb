class CreateGeorgeTable < ActiveRecord::Migration[5.0]
  def change
    create_table :george_tables do |t|
      t.string :name
      t.references :user, foreign_key: true
    end
  end
end
