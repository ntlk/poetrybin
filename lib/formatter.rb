class Formatter

  def self.escape_html(string)
    escape_angle_brackets(escape_ampersands(string))
  end

  def self.insert_line_breaks(string)
    string.gsub(/\n/, '<br>')
  end

  def self.insert_strong_tags(string)
    string.gsub(/\*{2}([^*\s].*?)\*{2}/, '<strong>\1</strong>')
  end

  private

  def self.escape_ampersands(string)
    string.gsub('&', '&amp;')
  end

  def self.escape_angle_brackets(string)
    escape_left_angle_bracket(escape_right_angle_bracket(string))
  end

  def self.escape_left_angle_bracket(string)
    string.gsub('<', '&lt;')
  end

  def self.escape_right_angle_bracket(string)
    string.gsub('>', '&gt;')
  end

end
