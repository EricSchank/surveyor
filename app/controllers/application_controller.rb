class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  after_filter :allow_iframe
  before_filter :set_p3p

  protected

  def load_site
    site = params[:site]
    head(404) and return unless site
    @site = Site.where(auid: site).first_or_create!
  end

  DEFAULT_TEXT = "We'd like to know how we're doing.\r\nWhen you get a chance, please click the link below to take a very short survey.\r\nThanks!"
  DEFAULT_QUESTION = "How was your experience working with the team on this ticket?\r\nPlease rate us below:"
  DEFAULT_ANSWERS = ["Excellent", "Good", "Below Average", "Unacceptable"]
  def load_text
    cfg = @site.site_config || @site.create_site_config(survey: DEFAULT_TEXT)
    @survey_text = cfg.survey
    @survey = @site.survey_questions.first_or_create!(
                  question: DEFAULT_QUESTION,
                  answer1: DEFAULT_ANSWERS[0],
                  answer2: DEFAULT_ANSWERS[1],
                  answer3: DEFAULT_ANSWERS[2],
                  answer4: DEFAULT_ANSWERS[3])
    @survey_question = @survey.question rescue DEFAULT_QUESTION
    @survey_answer1 = @survey.answer1 rescue DEFAULT_ANSWERS[0]
    @survey_answer2 = @survey.answer2 rescue DEFAULT_ANSWERS[1]
    @survey_answer3 = @survey.answer3 rescue DEFAULT_ANSWERS[2]
    @survey_answer4 = @survey.answer4 rescue DEFAULT_ANSWERS[3]
  end

  def allow_iframe
    response.headers.except! 'X-Frame-Options'
  end

  def set_p3p
    headers['P3P'] = 'CP="ALL DSP COR CURa ADMa DEVa OUR IND COM NAV"'
  end

end
