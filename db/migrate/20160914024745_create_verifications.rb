class CreateVerifications < ActiveRecord::Migration
  def change
    create_table :verifications do |t|
      t.references :profile, index: true, foreign_key: true, unique: true

      t.timestamps null: false
    end
  end
end
