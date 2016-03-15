class Part < ActiveRecord::Base
  belongs_to :category
  has_many :descriptors
end
