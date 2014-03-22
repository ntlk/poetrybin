class Formatter

  def self.format(string)
    string = escape_html(string)
    string = insert_line_breaks(string)
    string = insert_strong_tags(string)
    string = insert_em_tags(string)
  end

  def self.escape_html(string)
    escape_angle_brackets(escape_ampersands(string))
  end

  def self.change_text_sizes(string)
    string.gsub(/^#\s?(.+$)/, '<span class="size-one">\1</span>')
  end

  def self.insert_line_breaks(string)
    string.gsub(/\n/, '<br>')
  end

  def self.insert_strong_tags(string)
    string.gsub(/\*{2}([^*\s].*?)\*{2}/, '<strong>\1</strong>')
  end

  def self.insert_em_tags(string)
    string.gsub(/\*{1}([^*\s].*?)\*{1}/, '<em>\1</em>')
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
