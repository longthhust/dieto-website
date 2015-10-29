class CreateUserGoals < ActiveRecord::Migration
  def change
    create_table :user_goals do |t|
      t.string :user_id
      t.string :integer
      t.string :weight
      t.string :float
      t.string :height
      t.string :float
      t.string :bust_size
      t.string :float
      t.string :waist_size
      t.string :float
      t.string :hip_size
      t.string :float
      t.string :comment
      t.string :string

      t.timestamps null: false
    end
  end
end
