json.array!(@appointments) do |appointment|
  json.extract! appointment, :user_id, :position, :country_id
  json.url appointment_url(appointment, format: :json)
end
