class CreateNoSurveys < ActiveRecord::Migration
  def change
    create_table :no_surveys do |t|
      t.integer :site_id, null: false
      t.integer :author_id
      t.integer :ticket_id
      t.timestamps null: false
      t.index :site_id
      t.index [:site_id, :author_id]
      t.index [:site_id, :ticket_id]
    end
  end
end
