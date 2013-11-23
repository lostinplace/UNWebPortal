json.array!(@countries) do |country|
  json.extract! country, :name, :established_on, :political_system
  json.url country_url(country, format: :json)
end
