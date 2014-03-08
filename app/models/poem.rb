class Poem < ActiveRecord::Base
  validates :body, uniqueness: true, presence: true
end
