json.array!(@categories) do |category|
  json.extract! category, :id, :name, :ancestry, :retrievable, :remarks
  json.url category_url(category, format: :json)
end
