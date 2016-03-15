class Category < ActiveRecord::Base
  has_ancestry cache_depth: true #acts_as_tree
  before_save :cache_ancestry
  def cache_ancestry; self.names_depth_cache = path.map(&:name).join('/'); end

  has_many :parts
  has_many :sources
  validates_presence_of :name

  def is_retrievable?
    !!retrievable
  end
end
