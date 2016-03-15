json.array!(@parts) do |part|
  json.extract! part, :id, :structure_id, :name, :value_type, :default_value, :possible_values, :upper_boundary, :lower_boundary, :is_required, :is_fixed, :is_in_row, :hint, :placeholder, :label
  json.url part_url(part, format: :json)
end
