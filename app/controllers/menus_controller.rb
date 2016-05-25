class MenusController < ApplicationController
	def index
	type = view_context.get_survey_type(params[:type])
    query = if type then Survey::Survey.where(survey_type: type) else Survey::Survey end
    @surveys = query.order(created_at: :desc).page(params[:page])
	end
end
