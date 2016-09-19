class CreateVerificationRequests < ActiveRecord::Migration
  def change
    create_table :verification_requests do |t|
      t.references :user, index: true, foreign_key: true, unique: true

      t.timestamps null: false
    end
  end
end
