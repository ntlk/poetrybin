require 'spec_helper'

describe PoemsController do

  before do
    @poem = Poem.create(title: 'My poem', body: 'Violets are blue')
  end

  it 'does not hide a poem if person is not logged in', focus: true do
    controller.stub(logged_in?: false)
    put :hide, {id: @poem.id}
    @poem.reload

    expect(@poem).to_not be_hidden
  end

  it 'does hide a poem when person is an admin' do
    controller.stub(logged_in?: true)
    put :hide, {id: @poem.id}
    @poem.reload

    expect(@poem).to be_hidden
  end

end
