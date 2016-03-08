json.array!(@descriptors) do |descriptor|
  json.extract! descriptor, :id, :source_id, :name, :content
  json.url descriptor_url(descriptor, format: :json)
end
