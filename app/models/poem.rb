class Poem < ActiveRecord::Base
  validates :body, uniqueness: true, presence: true
  scope :visible, -> { where(hidden: false) }

  def self.random
    order('RANDOM()').first
  end
end
