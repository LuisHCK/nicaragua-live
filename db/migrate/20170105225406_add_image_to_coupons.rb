class AddImageToCoupons < ActiveRecord::Migration[5.0]
  def change
    add_attachment :coupons, :picture
  end
end
