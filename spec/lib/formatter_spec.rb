require 'spec_helper'

describe Formatter do

  it 'formats a string' do
    string = "Some poem body\nwith some formatting\n**bold** text\n*italics*\n# and font\n## sizes\n### sizes\n#### sizes"
    expect(Formatter.format(string)).to eq 'Some poem body<br>with some formatting<br><strong>bold</strong> text<br><em>italics</em><br><span class="size-largest">and font</span><br><span class="size-large">sizes</span><br><span class="size-medium">sizes</span><br><span class="size-small">sizes</span>'
  end

  context 'escaping html' do
    it 'should not change a plain string' do
      string = 'This is a simple string'
      expect(Formatter.escape_html(string)).to eq string
    end

    it 'should not change a string with bold' do
      string = 'String with some **bold**'
      expect(Formatter.escape_html(string)).to eq string
    end

    it 'should not change a string with emphasis' do
      string = 'String with some *emphasis*'
      expect(Formatter.escape_html(string)).to eq string
    end

    it 'should not change a string with a new line' do
      string = 'String with\na new line'
      expect(Formatter.escape_html(string)).to eq string
    end

    it 'should escape ampersands' do
      string = 'String with a lovely & stylish ampersand'
      expect(Formatter.escape_html(string)).to eq 'String with a lovely &amp; stylish ampersand'
    end

    it 'should escape angle brackets' do
      string = '<span>A string</span>'
      expect(Formatter.escape_html(string)).to eq '&lt;span&gt;A string&lt;/span&gt;'
    end
  end

  context 'handling new lines' do
    it 'should not insert breaks when new lines are not present' do
      string = 'An example string with no newlines'
      expect(Formatter.insert_line_breaks(string)).to eq string
    end

    it 'should insert line breaks if newline characters are present' do
      string = "An example\nwith a new line \n and another"
      expect(Formatter.insert_line_breaks(string)).to eq 'An example<br>with a new line <br> and another'
    end

    it 'should insert line breaks if newline characters include carriage returns' do
      string = "An example\r\nwith a new line \r\n and another"
      expect(Formatter.insert_line_breaks(string)).to eq 'An example<br>with a new line <br> and another'
    end
  end

  context 'bold text' do
    it 'should not add strong tags in a plain string' do
      string = 'Just a plain string'
      expect(Formatter.insert_strong_tags(string)).to eq string
    end

    it 'should not add string tags if there is only one asterisk' do
      string = 'A string with an * in it'
      expect(Formatter.insert_strong_tags(string)).to eq string
    end

    it 'should not add string tags if there are only two asterisks' do
      string = 'A string with ** in it'
      expect(Formatter.insert_strong_tags(string)).to eq string
    end

    it 'should not add string tags if there is no word inside four asterisks' do
      string = 'A string with a **** in it'
      expect(Formatter.insert_strong_tags(string)).to eq string
    end

    it 'should wrap in strong tags text surrounded by double asterisks' do
      string = 'A **well formatted** string'
      expect(Formatter.insert_strong_tags(string)).to eq 'A <strong>well formatted</strong> string'
    end

    it 'should wrap in strong tags text surrounded by double asterisks even when there is an asterisk in the middle' do
      string = 'A **well fo*rmatted** string'
      expect(Formatter.insert_strong_tags(string)).to eq 'A <strong>well fo*rmatted</strong> string'
    end

    it 'should deal with multiple matches' do
      string = '**A** **well for**matted **string**'
      expect(Formatter.insert_strong_tags(string)).to eq '<strong>A</strong> <strong>well for</strong>matted <strong>string</strong>'
    end

    it 'should wrap strong tags around words and not include whitespaces' do
      string = '**A** string with so**me emphasis** and also **** and at the **end**'
      expect(Formatter.insert_strong_tags(string)).to eq '<strong>A</strong> string with so<strong>me emphasis</strong> and also **** and at the <strong>end</strong>'
    end
  end

  context 'italicised text' do
    it 'should not add em tags in a plain string' do
      string = 'Just a plain string'
      expect(Formatter.insert_em_tags(string)).to eq string
    end

    it 'should not add em tags if there is only one asterisk' do
      string = 'A string with an * in it'
      expect(Formatter.insert_em_tags(string)).to eq string
    end

    it 'should not add em tags if there are only two asterisks' do
      string = 'A string with ** in it'
      expect(Formatter.insert_em_tags(string)).to eq string
    end

    it 'should not add em tags if there is no word inside four asterisks' do
      string = 'A string with a **** in it'
      expect(Formatter.insert_em_tags(string)).to eq string
    end

    it 'should wrap in em tags text surrounded by double asterisks' do
      string = 'A *well formatted* string'
      expect(Formatter.insert_em_tags(string)).to eq 'A <em>well formatted</em> string'
    end

    it 'should wrap em tags around words and not include whitespaces' do
      string = '*A* string with so*me emphasis* and also **** and at the *end*'
      expect(Formatter.insert_em_tags(string)).to eq '<em>A</em> string with so<em>me emphasis</em> and also **** and at the <em>end</em>'
    end

    it 'should deal with multiple matches' do
      string = '*A* *well for*matted *string*'
      expect(Formatter.insert_em_tags(string)).to eq '<em>A</em> <em>well for</em>matted <em>string</em>'
    end

  end

  context 'changing text sizes' do

    context 'largest size' do
      it 'returns same string if hash is not at the beginning of line' do
        string = 'hi, # hello'
        expect(Formatter.change_text_sizes(string)).to eq string
      end

      it 'resizes the line when # is present' do
        string = '#hello'
        expect(Formatter.change_text_sizes(string)).to eq '<span class="size-largest">hello</span>'
      end

      it 'resizes the line when #\s is present' do
        string = '# hello'
        expect(Formatter.change_text_sizes(string)).to eq '<span class="size-largest">hello</span>'
      end

      it 'resizes the # line when multiple lines are present' do
        string = "hello\n#hello\nhi there"
        expect(Formatter.change_text_sizes(string)).to eq "hello\n<span class=\"size-largest\">hello</span>\nhi there"
      end
    end

    context 'large size' do
      it 'returns same string if hash is not at the beginning of line' do
        string = 'hi, ## hello'
        expect(Formatter.change_text_sizes(string)).to eq string
      end

      it 'resizes the line when ## is present' do
        string = '##hello'
        expect(Formatter.change_text_sizes(string)).to eq '<span class="size-large">hello</span>'
      end

      it 'resizes the line when ##\s is present' do
        string = '## hello'
        expect(Formatter.change_text_sizes(string)).to eq '<span class="size-large">hello</span>'
      end

      it 'resizes the ## line when multiple lines are present' do
        string = "hello\n##hello\nhi there"
        expect(Formatter.change_text_sizes(string)).to eq "hello\n<span class=\"size-large\">hello</span>\nhi there"
      end
    end

    context 'medium size' do
      it 'returns same string if hash is not at the beginning of line' do
        string = 'hi, ### hello'
        expect(Formatter.change_text_sizes(string)).to eq string
      end

      it 'resizes the line when ### is present' do
        string = '###hello'
        expect(Formatter.change_text_sizes(string)).to eq '<span class="size-medium">hello</span>'
      end

      it 'resizes the line when ###\s is present' do
        string = '### hello'
        expect(Formatter.change_text_sizes(string)).to eq '<span class="size-medium">hello</span>'
      end

      it 'resizes the ### line when multiple lines are present' do
        string = "hello\n###hello\nhi there"
        expect(Formatter.change_text_sizes(string)).to eq "hello\n<span class=\"size-medium\">hello</span>\nhi there"
      end
    end

    context 'small size' do
      it 'returns same string if hash is not at the beginning of line' do
        string = 'hi, #### hello'
        expect(Formatter.change_text_sizes(string)).to eq string
      end

      it 'resizes the line when #### is present' do
        string = '####hello'
        expect(Formatter.change_text_sizes(string)).to eq '<span class="size-small">hello</span>'
      end

      it 'resizes the line when ####\s is present' do
        string = '#### hello'
        expect(Formatter.change_text_sizes(string)).to eq '<span class="size-small">hello</span>'
      end

      it 'resizes the #### line when multiple lines are present' do
        string = "hello\n####hello\nhi there"
        expect(Formatter.change_text_sizes(string)).to eq "hello\n<span class=\"size-small\">hello</span>\nhi there"
      end
    end
  end
end
