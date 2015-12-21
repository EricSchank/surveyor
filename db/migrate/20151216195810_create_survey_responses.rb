class CreateSurveyResponses < ActiveRecord::Migration
  def change
    create_table :survey_responses do |t|
      t.integer :survey_question_id, null: false
      t.integer :ticket_id
      t.integer :choice, default: -1
      t.string :comment, limit: 5000
      t.timestamps null: false
      t.index :survey_question_id
      t.index [:survey_question_id, :ticket_id]
    end
  end
end
