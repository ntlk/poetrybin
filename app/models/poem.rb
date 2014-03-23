class Poem < ActiveRecord::Base
  validates :body, uniqueness: true, presence: true
  scope :visible, -> {where(hidden: false)}
  scope :newest_first, -> {order('created_at DESC')}

  def self.random
    order('RANDOM()').first
  end

  def display_title
    return title if !title.blank?
    display_title = Formatter.strip_carriage_returns(body).scan(/^(.+?)$/).flatten.first
    if display_title.scan(/[\w-]+/).size > 5
      display_title = "#{body.split(' ')[0...5].join(' ')}…"
    end
    display_title
  end
end
