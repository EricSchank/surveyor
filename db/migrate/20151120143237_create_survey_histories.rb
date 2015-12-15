class CreateSurveyHistories < ActiveRecord::Migration
  def change
    create_table :survey_histories do |t|
      t.integer :site_id, null: false
      t.string :action_id, null: false
      t.integer :ticket_id, null: false
      t.boolean :ticket_specific, default: false
      t.boolean :successful, default: true
      t.integer :surveying_user_id
      t.timestamps null: false
      t.index :site_id
      t.index [:site_id, :ticket_id]
      t.index [:site_id, :action_id]
      t.index [:site_id, :surveying_user_id]
    end
  end
end
