require 'spec_helper'

describe Poem do
  it { should validate_presence_of(:body) }
  it { should validate_uniqueness_of(:body) }

  context '#display_title' do

    context 'title present' do
      it 'should return title' do
        poem = Poem.create(title: 'poem title', body: 'poem body')
        expect(poem.display_title).to eq poem.title
      end
    end

    context 'without title' do
      it 'should return the body if it is only one line' do
        poem = Poem.create(title: nil, body: "an example poem body")
        expect(poem.display_title).to eq 'an example poem body'
      end

      it 'should return the first line of body as display title' do
        poem = Poem.create(title: nil, body: "an example poem body\nwith a new line")
        expect(poem.display_title).to eq 'an example poem body'
      end

      it 'should return the first line of body as display title if title is an empty string' do
        poem = Poem.create(title: '', body: "an example poem body\nwith a new line")
        expect(poem.display_title).to eq 'an example poem body'
      end

      it 'should truncate the body if the line is longer than five words' do
        poem = Poem.create(title: nil, body: "an example poem which has many words in the first line\nand fewer on second")
        expect(poem.display_title).to eq 'an example poem which has…'
      end
    end
  end
end
