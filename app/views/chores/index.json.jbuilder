json.array!(@chores) do |chore|
  json.extract! chore, :id, :chore_name, :description, :user_to_complete
  json.url chore_url(chore, format: :json)
end
