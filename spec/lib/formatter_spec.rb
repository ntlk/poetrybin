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

end
