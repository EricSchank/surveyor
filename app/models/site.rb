class Site < ActiveRecord::Base
  has_one :site_config, dependent: :destroy
  has_many :no_survey, dependent: :destroy
  has_many :survey_history, dependent: :destroy
  has_many :survey_questions, dependent: :destroy
  has_many :suvery_responses, through: :survey_questions
end
