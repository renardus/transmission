class Source < ActiveRecord::Base
  has_ancestry cache_depth: true #acts_as_tree
  before_save :cache_ancestry
  def cache_ancestry; self.names_depth_cache = path.map(&:name).join('/'); end

  has_many :descriptors, dependent: :destroy
  belongs_to :category
  accepts_nested_attributes_for :descriptors, reject_if: :all_blank, allow_destroy: true
  #accepts_nested_attributes_for :children, reject_if: :all_blank, allow_destroy: true

  validates :name, :category_id, presence: true
  # validates :name is unique in context of siblings
  validates_associated :descriptors

  def parts; @parts ||= self.category.parts; end
  def get_descriptors
    if descriptors.blank?
      parts.each do |part|
        self.descriptors.create( part_id: part.id, name: part.name, content: part.default_value )
      end
    end
    descriptors.reload
  end
  def fq_name; @fq_name ||= [ category.names_depth_cache, name ].join('/'); end
  
  def features; Hash[ descriptors.map { |d| [ d.name, d.content ] } ]; end
  def featureless?; features.values.compact.join.blank?; end
end
