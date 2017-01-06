class AddTitleToUserGoals < ActiveRecord::Migration
  def change
    add_column :user_goals, :title, :string
  end
end
