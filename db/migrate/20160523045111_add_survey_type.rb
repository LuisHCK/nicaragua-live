class AddSurveyType < ActiveRecord::Migration
  def change
  	add_column :survey_surveys, :survey_type, :integer
  end
end
