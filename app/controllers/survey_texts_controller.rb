class SurveyTextsController < ApplicationController
  before_filter :load_site
  before_filter :load_text, only: :show

  def update
    text = params[:survey_text]
    head(400) and return unless text
    cfg = @site.site_config || @site.create_site_config
    cfg.survey = text
    cfg.save!
    render json: {text: text}
  end

  def show
    render json: {text: @survey_text}
  end
end
