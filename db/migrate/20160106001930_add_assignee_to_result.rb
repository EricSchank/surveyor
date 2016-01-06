class AddAssigneeToResult < ActiveRecord::Migration
  def change
    change_table :survey_responses do |t|
      t.integer :assignee_id
      t.index [:survey_question_id, :assignee_id]
    end
  end
end
