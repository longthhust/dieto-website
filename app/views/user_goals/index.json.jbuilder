json.array!(@user_goals) do |user_goal|
  json.extract! user_goal, :id, :weight, :comment, :deadline
  json.url user_goal_url(user_goal, format: :json)
end
