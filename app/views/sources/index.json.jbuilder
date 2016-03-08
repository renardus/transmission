json.array!(@sources) do |source|
  json.extract! source, :id, :name, :wizard_id, :user_id, :remarks
  json.url source_url(source, format: :json)
end
