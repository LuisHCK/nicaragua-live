class AddKeywordsToProfiles < ActiveRecord::Migration
  def change
    add_column :profiles, :keywords, :string, index: true
  end
end
