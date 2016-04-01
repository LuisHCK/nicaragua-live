class AddProfileToOffers < ActiveRecord::Migration
  def change
    add_reference :offers, :profile, index: true
    add_foreign_key :offers, :profiles
  end
end
