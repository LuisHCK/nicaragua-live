class AddCordobaToOffers < ActiveRecord::Migration
  def change
    add_column :offers, :cordoba, :boolean
  end
end
