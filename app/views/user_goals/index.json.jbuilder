json.array!(@user_goals) do |user_goal|
  json.extract! user_goal, :id, :user_id, :integer, :weight, :float, :height, :float, :bust_size, :float, :waist_size, :float, :hip_size, :float, :comment, :string
  json.url user_goal_url(user_goal, format: :json)
end
