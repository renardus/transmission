FactoryGirl.define do
  factory :part do
    structure_id 1
    name "MyString"
    value_type "MyString"
    default_value "MyString"
    possible_values "MyText"
    upper_boundary "MyString"
    lower_boundary "MyString"
    is_required false
    is_fixed false
    is_in_row false
    hint "MyString"
    placeholder "MyString"
    label "MyString"
  end
end
