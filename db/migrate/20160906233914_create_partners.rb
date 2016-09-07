class CreatePartners < ActiveRecord::Migration
  def change
    create_table :partners do |t|
      t.string :partner_range
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
