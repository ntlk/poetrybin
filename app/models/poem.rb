class Poem < ActiveRecord::Base
  validates :body, uniqueness: true, presence: true
  scope :visible, -> {where(hidden: false)}
  scope :newest_first, -> {order('created_at DESC')}

  def self.random
    order('RANDOM()').first
  end
end
