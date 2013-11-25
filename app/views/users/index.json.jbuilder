json.array!(@users) do |user|
  json.extract! user, :twitter
  json.url user_url(user, format: :json)
end
