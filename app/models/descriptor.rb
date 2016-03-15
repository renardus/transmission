class Descriptor < ActiveRecord::Base
  belongs_to :source
  belongs_to :part
end
