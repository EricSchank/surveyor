class Site < ActiveRecord::Base
  has_one :site_config
  has_many :no_survey
  has_many :survey_history
end
