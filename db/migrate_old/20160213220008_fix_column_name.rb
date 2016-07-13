class FixColumnName < ActiveRecord::Migration
  def change
    rename_column :follows, :clientprofiles_id, :clientprofile_id
  end
end
