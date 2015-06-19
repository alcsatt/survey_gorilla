class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :body, null: false
      t.integer :survey_id
      t.timestamps null: false
    end
  end
end
