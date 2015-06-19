class CreateTakenSurveys < ActiveRecord::Migration
  def change
    create_table :taken_surveys do |t|
      t.integer :user_id
      t.integer :survey_id
      t.timestamps null: false
    end
  end
end
