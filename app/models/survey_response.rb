class SurveyResponse < ActiveRecord::Base
  include ERB::Util
  belongs_to :survey_question

  def comment
    html_escape(self[:comment])
  end
end
