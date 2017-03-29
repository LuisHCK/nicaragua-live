class SurveysController < ApplicationController
  before_action :authenticate_user!, except: [:show,:index]
  before_action :load_survey, only: [:show, :edit, :update, :destroy]

  def index
    type = view_context.get_survey_type(params[:type])
    query = if type then Survey::Survey.where(survey_type: type) else Survey::Survey end
    if user_signed_in?
      @surveys = query.where(user_id: current_user.id).order(created_at: :desc).page(params[:page])
    else
      @surveys = query.order(created_at: :desc).page(params[:page])
    end
  end

  def new
    @survey = Survey::Survey.new(survey_type: view_context.get_survey_type(params[:type]))
  end

  def create
    @survey = Survey::Survey.new(params_whitelist)
        @survey.user_id = current_user.id
    if @survey.valid? && @survey.save
      default_redirect
    else
      redirect_to new_survey_path, notice:"Hubo un error"

    end
  end

  def edit
  end

  def show
  end

  def update
    if @survey.update_attributes(params_whitelist)
      default_redirect
    else
      #build_flash(@survey)
      redirect_to edit_survey_path(@survey), notice:"Hubo un error"
    end
  end

  def destroy
    @survey.destroy
    default_redirect
  end

  private

  def default_redirect
    redirect_to surveys_path, notice: I18n.t("surveys_controller.#{action_name}")
  end

  def load_survey
    @survey = Survey::Survey.find(params[:id])
  end

  def params_whitelist
    params.require(:survey_survey).permit(Survey::Survey::AccessibleAttributes << :survey_type)
  end

end
