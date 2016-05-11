class CreateValorations < ActiveRecord::Migration
  def change
    create_table :valorations do |t|

      t.timestamps null: false
    end
  end
end
