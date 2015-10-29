json.array!(@user_logs) do |user_log|
  json.extract! user_log, :id, :user_id, :logon, :logoff
  json.url user_log_url(user_log, format: :json)
end
