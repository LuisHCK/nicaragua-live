class AddCampaignToProfiles < ActiveRecord::Migration
  def change
    add_column :profiles, :aasm_campaign, :string, default: 'noone'
  end
end
