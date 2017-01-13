class CreateReleases < ActiveRecord::Migration
  def change
    create_table :releases do |t|
      t.decimal :version
      t.text :description
      t.text :changelog
      t.string :dwnl_link
      t.integer :dwnl_count
      t.references :client, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
