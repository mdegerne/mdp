class Heading < ActiveRecord::Base
  has_many :questions, :order => :position
end
