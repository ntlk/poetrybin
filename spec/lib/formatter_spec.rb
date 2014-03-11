require 'spec_helper'

describe Formatter do

  context 'escaping html' do
    it 'should not change a plain string' do
      string = 'This is a simple string'
      formatter = Formatter.new(string)
      expect(formatter.escape_html).to eq string
    end

    it 'should not change a string with bold' do
      string = 'String with some **bold**'
      formatter = Formatter.new(string)
      expect(formatter.escape_html).to eq string
    end

    it 'should not change a string with emphasis' do
      string = 'String with some *emphasis*'
      formatter = Formatter.new(string)
      expect(formatter.escape_html).to eq string
    end

    it 'should not change a string with a new line' do
      string = 'String with\na new line'
      formatter = Formatter.new(string)
      expect(formatter.escape_html).to eq string
    end

    it 'should escape ampersands' do
      string = 'String with a lovely & stylish ampersand'
      formatter = Formatter.new(string)
      expect(formatter.escape_html).to eq 'String with a lovely &amp; stylish ampersand'
    end

    it 'should escape angle brackets' do
      string = '<span>A string</span>'
      formatter = Formatter.new(string)
      expect(formatter.escape_html).to eq '&lt;span&gt;A string&lt;/span&gt;'
    end
  end

  context 'handling new lines' do
    it 'should not insert breaks when new lines are not present' do
      string = 'An example string with no newlines'
      formatter = Formatter.new(string)
      expect(formatter.insert_line_breaks).to eq string
    end

    it 'should insert line breaks if newline characters are present' do
      string = "An example\nwith a new line \n and another"
      formatter = Formatter.new(string)
      expect(formatter.insert_line_breaks).to eq 'An example<br>with a new line <br> and another'
    end
  end

end
