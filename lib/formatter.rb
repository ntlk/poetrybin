class Formatter

  def initialize(string)
    @string = string
  end

  def escape_html
    escape_ampersands
    escape_angle_brackets
    return @string
  end

  def insert_line_breaks
    @string.gsub!(/\n/, '<br>')
    return @string
  end

  def insert_strong_tags
    @string.gsub!(/\s(\*{2}\b)([^*]*)(\b\*{2})\s/, ' <strong>\2</strong> ')
    return @string
  end

  private

  def escape_ampersands
    @string.gsub!('&', '&amp;')
  end

  def escape_angle_brackets
    escape_left_angle_bracket
    escape_right_angle_bracket
  end

  def escape_left_angle_bracket
    @string.gsub!('<', '&lt;')
  end

  def escape_right_angle_bracket
    @string.gsub!('>', '&gt;')
  end

end
