class SurveyResponsesController < ApplicationController
  before_filter :load_site
  before_filter :load_text
  before_filter :load_responses

  def index
    render json: @responses
  end

  private
  def load_responses
    @responses = @survey.survey_responses
    @responses = @responses.where(ticket_id: params[:ticket_id]) unless params[:ticket_id].blank?
  end

end
