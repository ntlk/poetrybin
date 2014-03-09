class Poem < ActiveRecord::Base
  validates :body, uniqueness: true, presence: true
  scope :random, -> { order('RANDOM()') }
  scope :visible, -> { where(hidden: false) }
end
