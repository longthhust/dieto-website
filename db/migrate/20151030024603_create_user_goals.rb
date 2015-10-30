class CreateUserGoals < ActiveRecord::Migration
  def change
    create_table :user_goals do |t|
      t.float :weight, null: false
      t.text :comment
      t.date :deadline, null: false

      t.timestamps null: false
      
      t.belongs_to :user, index: true
    end
  end
end
