module SourcesHelper
  # form.simple_fields_for :descriptors do |f|
  def descriptor_part(f, descriptor)
     part = descriptor.part
     f.input_field :content, as: part.value_type.to_sym, label: part.name.capitalize,
       hint: part.hint, required: part.is_required 
  end
end
