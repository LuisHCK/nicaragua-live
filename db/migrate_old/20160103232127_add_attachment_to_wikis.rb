class AddAttachmentToWikis < ActiveRecord::Migration
  def change
    add_attachment :wikis, :cover
  end
end
