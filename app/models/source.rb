class Source < ActiveRecord::Base
  has_many :descriptors, dependent: :destroy
  accepts_nested_attributes_for :descriptors, reject_if: :all_blank, allow_destroy: true
end
