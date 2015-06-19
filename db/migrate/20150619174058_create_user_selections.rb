class CreateUserSelections < ActiveRecord::Migration
  def change
    create_table :user_selections do |t|
      t.integer :user_id
      t.integer :choice_id
      t.timestamps null: false
    end
  end
end
