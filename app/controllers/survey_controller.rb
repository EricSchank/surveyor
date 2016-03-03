class SurveyController < ApplicationController
  before_filter :load_site
  before_filter :load_text, only: [:index, :create]

  def index
    @ticket_id = params[:ticket_id]
    @aid = params[:aid]
    @question = @survey_question.gsub(/\r\n/, '<br/>')
  end

  def create
    p = survey_params
    @ticket_id = p[:ticket_id]
    assignee_id = p[:aid]
    r = @survey.survey_responses.create!(ticket_id: @ticket_id, assignee_id: assignee_id, choice: p[:answer], comment: p[:comment])
  end

  def reset_account
    if @site.destroy!
      head(:ok) and return
    else
      head(:internal_server_error) and return
    end
  end

  private
  def survey_params
    params.permit(:ticket_id, :aid, :answer, :comment)
  end
end
