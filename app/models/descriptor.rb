class Descriptor < ActiveRecord::Base
  belongs_to :source
  belongs_to :part
  validates :source_id, :part_id, presence: true
  validate :behaves_according_to_part, on: :update

  #part: value_type: 'string', default_value: '', possible_values:'', upper_boundary: '', lower_boundary: '', is_required: true, is_fixed: false, is_in_row: false, hint: 'database connection identifier', placeholder: 'database name', label: ''
  def behaves_according_to_part
    if part.is_required
      errors.add(:content, "has to have a value") if content.blank?
    end
    unless content.blank?
      case part.value_type
      when 'integer'
        errors.add(:content, "must be integer") unless content.match /[+-]?\d+/
      when 'float'
        errors.add(:content, "must be float") unless content.match /^\s*[+-]?\d+(\.\d+)?\s*$/
      end
    end
    unless part.possible_values.blank?
      values = possible_values.split(',')
      self.content = content.strip
      errors.add(:content, "not a possible value") unless values.include? content
    end
  end
end
