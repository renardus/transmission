class Source < ActiveRecord::Base
  has_many :descriptors, dependent: :destroy
end
