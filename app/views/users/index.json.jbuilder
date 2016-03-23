json.array!(@users) do |user|
  json.extract! user, :id, :login, :avatar_url, :url, :html_url, :repos_url, :type
  json.url user_url(user, format: :json)
end
