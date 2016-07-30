class CreateFranks < ActiveRecord::Migration[5.0]
  def change
    create_table :franks do |t|

      t.timestamps
    end
  end
end
