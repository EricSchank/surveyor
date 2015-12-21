class SurveyQuestionsController < ApplicationController
  before_filter :load_site
  before_filter :load_text, only: :show

  def update
    question = params[:survey_question]
    answer1 = params[:survey_answer1]
    answer2 = params[:survey_answer2]
    answer3 = params[:survey_answer3]
    answer4 = params[:survey_answer4]
    head(400) and return unless question && answer1 && answer2 && answer3 && answer4
    cfg = @site.survey_questions.first_or_create
    cfg.question = question
    cfg.answer1 = answer1
    cfg.answer2 = answer2
    cfg.answer3 = answer3
    cfg.answer4 = answer4
    cfg.save!
    render json: {question: cfg.question,
                  answers:[cfg.answer1, cfg.answer2, cfg.answer3, cfg.answer4]}
  end

  def show
    render json: {question: @survey_question,
                  answers:[@survey_answer1, @survey_answer2, @survey_answer3, @survey_answer4]}
  end
end
