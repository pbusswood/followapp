json.array!(@reminders) do |reminder|
  json.extract! reminder, :reminder
  json.url reminder_url(reminder, format: :json)
end
