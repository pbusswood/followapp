json.array!(@contacts) do |contact|
  json.extract! contact, :contact_first_name, :contact_last_name, :contact_email, :contact_mobile, :contact_phone
  json.url contact_url(contact, format: :json)
end
