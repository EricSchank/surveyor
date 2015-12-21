class SurveyQuestion < ActiveRecord::Base
  belongs_to :site
  has_many :survey_responses
end
