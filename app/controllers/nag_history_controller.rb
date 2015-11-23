class NagHistoryController < ApplicationController
  before_filter :load_site

  def create
    @history = []
    good = Array(params[:stid])
    bad = Array(params[:ftid])
    @action_id = "#{params[:me]}--#{Time.now.to_i}"
    Rails.logger.error "CRT #{@aid}\n#{good.inspect}\n#{bad.inspect}"
    good.each{ |tick| log_history(tick.to_i, true) }
    bad.each{ |tick| log_history(tick.to_i, false) }
    render json: @history
  end

  def index
    ret = @site.nag_history.order(created_at: :desc, action_id: :desc, ticket_id: :asc)
    ret = ret.where(ticket_id: params[:ticket_id]) if params[:ticket_id]
    render json: ret
  end

  private

  def log_history(ticket_id, success)
    Rails.logger.error "LOG #{ticket_id}: #{success}"
    @history << @site.nag_history.create!(
      ticket_id: ticket_id,
      action_id: @action_id,
      successful: success,
      nagging_user_id: params[:me],
      ticket_specific: params[:ts]
    )
  end
end
