class CreateSurveyQuestions < ActiveRecord::Migration
  def change
    create_table :survey_questions do |t|
      t.integer :site_id, null: false
      t.string :question, limit: 5000
      t.string :answer1, limit: 500
      t.string :answer2, limit: 500
      t.string :answer3, limit: 500
      t.string :answer4, limit: 500
      t.timestamps null: false
      t.index :site_id
    end
  end
end
