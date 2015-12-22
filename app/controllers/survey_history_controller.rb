class SurveyHistoryController < ApplicationController
  before_filter :load_site

  def create
    @history = []
    good = Array(params[:stid])
    bad = Array(params[:ftid])
    @action_id = "#{params[:me]}--#{Time.now.to_i}"
    good.each{ |tick| log_history(tick.to_i, true) }
    bad.each{ |tick| log_history(tick.to_i, false) }
    render json: @history
  end

  def index
    ret = @site.survey_history.order(created_at: :desc, action_id: :desc, ticket_id: :asc)
    ret = ret.where(ticket_id: params[:ticket_id]) if params[:ticket_id]
    render json: ret
  end

  private

  def log_history(ticket_id, success)
    @history << @site.survey_history.create!(
      ticket_id: ticket_id,
      action_id: @action_id,
      successful: success,
      surveying_user_id: params[:me],
      ticket_specific: params[:ts]
    )
  end
end
