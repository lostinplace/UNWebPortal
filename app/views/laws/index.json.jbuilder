json.array!(@laws) do |law|
  json.extract! law, :title, :description, :effective_on, :tags
  json.url law_url(law, format: :json)
end
