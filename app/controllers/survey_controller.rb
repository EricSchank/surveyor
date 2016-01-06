class SurveyController < ApplicationController
  before_filter :load_site
  before_filter :load_text, only: [:index, :create]

  def index
    @ticket_id = params[:ticket_id]
    @aid = params[:aid]
    @question = @survey_question.gsub(/\r\n/, '<br/>')
  end

  def create
    @ticket_id = params[:ticket_id]
    assignee_id = params[:aid]
    r = @survey.survey_responses.create!(ticket_id: @ticket_id, assignee_id: assignee_id, choice: params[:answer], comment: params[:comment])
  end
end
