class CreateTodos < ActiveRecord::Migration
  def change
    create_table :todos do |t|
      t.string :title
      t.text :body
      t.string :state, default: 'open'

      t.timestamps null: false
    end
  end
end
