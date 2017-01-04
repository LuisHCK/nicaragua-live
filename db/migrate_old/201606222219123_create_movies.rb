class CreateMovies < ActiveRecord::Migration
  def change
    #drop_table :movies
    create_table :movies do |t|
      t.string :title
      t.string :original_title
      t.string :country
      t.string :production
      t.string :script
      t.text :allocation
      t.string :clasification
      t.text :sinopsis
      t.string  :lang

      t.timestamps null: false
    end
    add_reference :movies, :user, index: true, foreign_key: true
    add_attachment :movies, :cover
    add_attachment :movies, :banner
  end
end
