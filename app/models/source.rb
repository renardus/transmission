class Source < ActiveRecord::Base
  has_ancestry
  has_many :descriptors, dependent: :destroy
  belongs_to :category
  accepts_nested_attributes_for :descriptors, reject_if: :all_blank, allow_destroy: true
  #accepts_nested_attributes_for :children, reject_if: :all_blank, allow_destroy: true

  def parts; @parts ||= self.category.parts; end
  def get_descriptors
    if descriptors.blank?
      parts.each do |part|
        self.descriptors.create( part_id: part.id, name: part.name, content: part.default_value )
      end
    end
    descriptors.reload
  end
  
  def features; Hash[ descriptors.map { |d| [ d.name, d.content ] } ]; end
  def featureless?; features.values.compact.join.blank?; end
end
